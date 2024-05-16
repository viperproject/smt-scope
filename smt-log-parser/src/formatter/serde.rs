use std::borrow::Cow;

use fxhash::FxHashMap;

use crate::NonMaxU32;

use super::defns;

#[derive(serde::Serialize, serde::Deserialize)]
struct TermDisplayContext<'a> {
    string_matchers: Cow<'a, FxHashMap<(Cow<'static, str>, Option<NonMaxU32>), defns::TermDisplay>>,
    regex_matchers: Cow<'a, Vec<defns::TermDisplay>>,
}

impl serde::Serialize for defns::TermDisplayContext {
    fn serialize<S: serde::Serializer>(&self, serializer: S) -> Result<S::Ok, S::Error> {
        let (string_matchers, regex_matchers) = self.to_parts();
        let self_ = TermDisplayContext {
            string_matchers: Cow::Borrowed(string_matchers),
            regex_matchers: Cow::Borrowed(regex_matchers),
        };
        self_.serialize(serializer)
    }
}
impl<'de> serde::Deserialize<'de> for defns::TermDisplayContext {
    fn deserialize<D: serde::Deserializer<'de>>(deserializer: D) -> Result<Self, D::Error> {
        let self_: TermDisplayContext = serde::Deserialize::deserialize(deserializer)?;
        let string_matchers = self_.string_matchers.into_owned();
        let regex_matchers = self_.regex_matchers.into_owned();
        Ok(Self::from_parts(string_matchers, regex_matchers))
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
        Ok(defns::RegexMatcher::new(s.into_owned()).map_err(serde::de::Error::custom)?)
    }
}
