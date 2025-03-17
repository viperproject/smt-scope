use std::borrow::Cow;

use crate::NonMaxU32;

use super::defns;

#[derive(serde::Serialize, serde::Deserialize)]
struct TermDisplayContext<'a> {
    string_matchers: StringMatchers<'a>,
    regex_matchers: Cow<'a, Vec<defns::TermDisplay>>,
    fallback: Cow<'a, defns::FallbackFormatter>,
}

pub type StringMatchers<'a> = Vec<(
    Cow<'a, (Cow<'static, str>, Option<NonMaxU32>)>,
    Cow<'a, defns::TermDisplay>,
)>;

impl serde::Serialize for defns::TermDisplayContext {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        let (string_matchers, regex_matchers, fallback) = self.to_parts();
        let self_ = TermDisplayContext {
            string_matchers: string_matchers
                .iter()
                .map(|(k, v)| (Cow::Borrowed(k), Cow::Borrowed(v)))
                .collect(),
            regex_matchers: Cow::Borrowed(regex_matchers),
            fallback: Cow::Borrowed(fallback),
        };
        self_.serialize(serializer)
    }
}
impl<'de> serde::Deserialize<'de> for defns::TermDisplayContext {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let self_: TermDisplayContext = serde::Deserialize::deserialize(deserializer)?;
        let string_matchers = self_
            .string_matchers
            .into_iter()
            .map(|(k, v)| (k.into_owned(), v.into_owned()))
            .collect();
        let regex_matchers = self_.regex_matchers.into_owned();
        let fallback = self_.fallback.into_owned();
        Ok(Self::from_parts(string_matchers, regex_matchers, fallback))
    }
}

#[derive(serde::Serialize, serde::Deserialize)]
struct RegexMatcher<'a>(Cow<'a, String>);

impl serde::Serialize for defns::RegexMatcher {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        RegexMatcher(Cow::Borrowed(self.original())).serialize(serializer)
    }
}
impl<'de> serde::Deserialize<'de> for defns::RegexMatcher {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let RegexMatcher(s) = serde::Deserialize::deserialize(deserializer)?;
        defns::RegexMatcher::new(s.into_owned()).map_err(serde::de::Error::custom)
    }
}
