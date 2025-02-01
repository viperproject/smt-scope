use crate::NonMaxU32;

use super::*;

const INVALID_REGEX: &str = "valid regex";

const EXACT: &str = "exact name";

impl Formatter {
    fn new(s: Vec<Result<SubFormatter, (bool, BindPower)>>) -> Self {
        let mut outputs = Vec::<SubFormatter>::new();
        let mut bp_left = DEFAULT_BIND_POWER;
        let mut can_set_left = true;
        let mut bp_right = None;
        for s in s {
            let csl = can_set_left;
            let bpr = bp_right.take();
            can_set_left = false;

            let mut s = match s {
                Ok(s) => s,
                Err((true, bp)) => {
                    // Expect `matches!((csl, bpr), (true, None)`
                    if csl {
                        let lbp = outputs.last_mut().map(|o| o.bp_right().unwrap());
                        let lbp = lbp.unwrap_or(&mut bp_left);
                        *lbp = bp;
                    }
                    continue;
                }
                Err((false, bp)) => {
                    // Expect `matches!((csl, bpr), (false, None)`
                    bp_right = Some(bp);
                    continue;
                }
            };
            if let Some((nbp, bp)) = s.bp_left().zip(bpr) {
                *nbp = bp;
            }
            can_set_left = s.bp_right().is_some();
            outputs.push(s);
        }
        Self {
            bind_power: BindPowerPair { left: bp_left, right: bp_right.unwrap_or(DEFAULT_BIND_POWER) },
            outputs,
            max_capture: None,
        }
    }
}

impl SubFormatter {
    fn bp_left(&mut self) -> Option<&mut BindPower> {
        use SubFormatterKind::*;
        match &mut self.kind {
            String(..) => None,
            Single { bind_power, .. } => Some(&mut bind_power.left),
            Repeat { formatter, .. } => Some(&mut formatter.left),
            Capture(..) => None,
        }
    }
    fn bp_right(&mut self) -> Option<&mut BindPower> {
        use SubFormatterKind::*;
        match &mut self.kind {
            String(..) => None,
            Single { bind_power, .. } => Some(&mut bind_power.right),
            Repeat { formatter, .. } => Some(&mut formatter.right),
            Capture(..) => None,
        }
    }
}

enum SubFormatterData {
    None,
    Path(SubFormatter),
    Repeat(ChildIndex, RepeatFormatter),
}

impl SubFormatterData {
    fn new(self, index: ChildIndex) -> SubFormatter {
        match self {
            SubFormatterData::None =>
                SubFormatter::no_path(SubFormatterKind::Single { index, bind_power: Self::bind_power() }),
            SubFormatterData::Path(mut sf) => {
                sf.path.insert(0, index);
                sf
            }
            SubFormatterData::Repeat(to, formatter) =>
                SubFormatter::no_path(SubFormatterKind::Repeat { from: index, to, formatter }),
        }
    }
    fn bind_power() -> BindPowerPair {
        BindPowerPair { left: DEFAULT_BIND_POWER, right: DEFAULT_BIND_POWER }
    }
}

impl Default for RepeatFormatter {
    fn default() -> Self {
        todo!()
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
enum RepeatKey {
    Left,
    LeftAlways,
    Sep,
    Center,
    RightAlways,
    Right,
}

impl RepeatFormatter {
    fn new(mut rf: Vec<(RepeatKey, Formatter)>) -> Self {
        let mut self_ = Self::default();
        rf.sort_by_key(|(k, _)| *k);
        rf.dedup_by_key(|(k, _)| *k);
        assert!(rf.len() <= 6);
        if let Some((RepeatKey::Left | RepeatKey::LeftAlways, f)) = rf.first() {
            self_.left = f.bind_power.right;
        }
        if let Some((RepeatKey::Right | RepeatKey::RightAlways, f)) = rf.last() {
            self_.right = f.bind_power.left;
        }
        rf.iter().find()
        todo!()
    }
}

peg::parser! {
    grammar term_display_parser() for str {
        rule _ = quiet! { ___* __ ** ___ ___* }

        rule ___ = quiet! { " " / "\t" } / expected!("whitespace")

        rule __ = "//" (! "\n" [_])* / "/*" (! "*/" [_])* "*/"

        // Matcher

        rule wildcard() -> MatcherKind
            = "_" { MatcherKind::Wildcard }

        rule regex_inner()
            = quiet! { ([^'/'|'\\'] / "\\\\" / "\\/" / "\\")+ } / expected!("regex")

        rule regex() -> MatcherKind
            = "/" s:$(regex_inner()) "/" {? RegexMatcher::new(s.to_string()).map(MatcherKind::Regex).map_err(|_| INVALID_REGEX) }

        rule exact() -> MatcherKind
            = s:$(quiet! { !___[^'/'|'('|')'](!___[^'('|')'])* } / expected!(EXACT)) { MatcherKind::Exact(s.to_string()) }

        rule matcher_kind() -> MatcherKind
            = wildcard() / regex() / exact()

        rule matcher_child() -> Matcher
            = ___ c:matcher() { c }

        pub rule matcher() -> Matcher
            = "(" kind:matcher_kind() c:matcher_child()* ")" { Matcher { kind, children: Some(c) } }
                / kind:matcher_kind() { Matcher { kind, children: None } }

        // Formatter

        rule digits() = ['0'..='9']+

        rule u32() -> NonMaxU32
            = n:$(digits()) {? n.parse().or(Err("u32")) }

        rule i32() -> i32
            = n:$(['-']?digits()) {? n.parse().or(Err("i32")) }

        rule i32_pos() -> i32
            = n:$(digits()) {? n.parse().or(Err("i32")) }

        rule repeat_key() -> RepeatKey
            = "l" { RepeatKey::Left }
            / "la" { RepeatKey::LeftAlways }
            / "r" { RepeatKey::Right }
            / "ra" { RepeatKey::RightAlways }
            / "s" { RepeatKey::Sep }
            / "c" { RepeatKey::Center }

        rule repeat_fmt_one() -> (RepeatKey, Formatter) = k:repeat_key() "=" f:fmt(true) "|" { (k, f) }
        
        rule repeat_fmt() -> RepeatFormatter
            = "|" rf:repeat_fmt_one()* { RepeatFormatter::new(rf) }

        rule sub_fmt_child() -> SubFormatterData
            = ":" sf:sub_fmt_only() { SubFormatterData::Path(sf) }
            / ".." c:child() rf:repeat_fmt()? { SubFormatterData::Repeat(c, rf.unwrap_or_default()) }
            / { SubFormatterData::None }

        rule bind() -> (bool, BindPower)
            = "<" i:i32() { (true, i as u32) }
            / ">" i:i32() { (false, i as u32) }

        rule child() -> ChildIndex
            = "#" i:i32() { ChildIndex(i) }

        rule sub_fmt_only() -> SubFormatter
            = "$" i:u32() { SubFormatter::no_path(SubFormatterKind::Capture(i)) }
            / c:child() d:sub_fmt_child() { d.new(c) }

        rule sub_fmt_inner() -> Result<SubFormatter, (bool, BindPower)>
            = b:bind() { Err(b) } / sf:sub_fmt_only() { Ok(sf) }

        rule char(repeat: bool) = [^c if c == '{' || c == '}' || (repeat && c == '|')] / "{{" / "}}" / "||"

        rule sub_fmt(repeat: bool) -> Result<SubFormatter, (bool, BindPower)>
            = s:$(char(repeat)+) { Ok(SubFormatter::no_path(SubFormatterKind::String(if repeat { s.replace("||", "|") } else { s.to_string() }))) }
            / !char(repeat)"{" s:sub_fmt_inner() !char(repeat)"}" { s }

        rule fmt(repeat: bool) -> Formatter
            = s:sub_fmt(repeat)* { Formatter::new(s) }

        pub rule formatter() -> Formatter = fmt(false)
    }
}
fn test() {
    // format!("{<-1} Hello {$0} {\"or\"} there {>-10}{#1}{<20} now {#1:#0:$0} foo {#0..#-1|l=(|ll={$0} |s= |r=)|} {>10}");
    // "-1 + -10" / "-(1 + -10)";
    // "foo(10, 10)"

    // strongly binding: `-(_)` and `(_).`
    // weakly binding: `_ + _`, `foo(_)`
}

#[test]
fn test_matcher() {
    use term_display_parser::matcher;
    use peg::str::LineCol;

    fn error<T>(location: T, expected: impl IntoIterator<Item = &'static str>) -> peg::error::ParseError<T> {
        let mut es = peg::error::ErrorState::new(0);
        for e in expected.into_iter() {
            es.mark_failure_slow_path(0, e);
        }
        peg::error::ParseError { location, expected: es.expected }
    }
    fn exact(s: &str, children: Option<Vec<Matcher>>) -> Matcher {
        Matcher { kind: MatcherKind::Exact(s.to_string()), children }
    }
    fn regex(s: &str, children: Option<Vec<Matcher>>) -> Matcher {
        Matcher { kind: MatcherKind::Regex(RegexMatcher::new(s.to_string()).unwrap()), children }
    }
    fn wildcard(children: Option<Vec<Matcher>>) -> Matcher {
        Matcher { kind: MatcherKind::Wildcard, children }
    }

    let expected = error(LineCol { line: 1, column: 1, offset: 0 }, ["\"(\"", "\"/\"", "\"_\"", EXACT]);
    assert_eq!(matcher(""), Err(expected));
    let expected = error(LineCol { line: 1, column: 1, offset: 0 }, ["\"(\"", "\"/\"", "\"_\"", EXACT]);
    assert_eq!(matcher(")"), Err(expected));

    let expected = error(LineCol { line: 1, column: 2, offset: 1 }, ["EOF"]);
    assert_eq!(matcher("_)"), Err(expected));
    let expected = error(LineCol { line: 1, column: 2, offset: 1 }, ["EOF"]);
    assert_eq!(matcher("a )"), Err(expected));

    let expected = error(LineCol { line: 1, column: 2, offset: 1 }, ["\"/\"", "\"_\"", EXACT]);
    assert_eq!(matcher("()"), Err(expected));

    let expected = error(LineCol { line: 1, column: 4, offset: 3 }, [INVALID_REGEX]);
    assert_eq!(matcher("/)/"), Err(expected));
    let expected = error(LineCol { line: 1, column: 4, offset: 3 }, ["\"/\""]);
    assert_eq!(matcher("/\\/"), Err(expected));
    let expected = error(LineCol { line: 1, column: 4, offset: 3 }, ["\"/\""]);
    assert_eq!(matcher("(/)"), Err(expected));
    let expected = error(LineCol { line: 1, column: 3, offset: 2 }, ["regex"]);
    assert_eq!(matcher("(//)"), Err(expected));

    let expected = wildcard(None);
    assert_eq!(matcher("_"), Ok(expected));
    let expected = wildcard(Some(Vec::new()));
    assert_eq!(matcher("(_)"), Ok(expected));

    let expected = regex("$(#@)\\\\\\/\\d+^", None);
    assert_eq!(matcher("/$(#@)\\\\\\/\\d+^/"), Ok(expected));
    let expected = regex(".*", Some(Vec::new()));
    assert_eq!(matcher("(/.*/)"), Ok(expected));

    let expected = exact("foo-bar", None);
    assert_eq!(matcher("foo-bar"), Ok(expected));
    let expected = exact("foo-bar", Some(Vec::new()));
    assert_eq!(matcher("(foo-bar)"), Ok(expected));

    let expected = exact("f", None);
    assert_eq!(matcher("f"), Ok(expected));
    let expected = exact("f", Some(Vec::new()));
    assert_eq!(matcher("(f)"), Ok(expected));

    let expected = wildcard(Some(vec![wildcard(None), wildcard(None)]));
    assert_eq!(matcher("(_ _ _)"), Ok(expected));

    let expected = exact("f", Some(vec![exact("o", Some(vec![exact("o", None)]))]));
    assert_eq!(matcher("(f (o o))"), Ok(expected));

    let expected = wildcard(Some(vec![regex("regex", Some(Vec::new()))]));
    assert_eq!(matcher("(_ (/regex/))"), Ok(expected));

    let expected = exact("f", Some(vec![regex("regex", Some(Vec::new()))]));
    assert_eq!(matcher("(f (/regex/))"), Ok(expected));
    let expected = regex("r", Some(vec![exact("f", Some(Vec::new()))]));
    assert_eq!(matcher("(/r/ (f))"), Ok(expected));

    let expected = exact("f", Some(vec![regex("regex", Some(Vec::new())), exact("o", None)]));
    assert_eq!(matcher("(f (/regex/) o)"), Ok(expected));

    let expected = regex("r", Some(vec![wildcard(Some(Vec::new())), exact("o", Some(vec![exact("o", None)]))]));
    assert_eq!(matcher("(/r/ (_) (o o))"), Ok(expected));
}
