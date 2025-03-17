use std::{ops::Deref, rc::Rc};

/// A type which represents either an owned T or an Rc<T>. This should generally
/// not be constructed directly, instead either of the above two can be
/// returned (and the corresponding from representation will be used).
pub enum MaybeRc<T> {
    No(T),
    Rc(Rc<T>),
}

impl<T> From<T> for MaybeRc<T> {
    fn from(t: T) -> Self {
        MaybeRc::No(t)
    }
}

impl<T> From<Rc<T>> for MaybeRc<T> {
    fn from(t: Rc<T>) -> Self {
        MaybeRc::Rc(t)
    }
}

impl<T> Deref for MaybeRc<T> {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        match self {
            MaybeRc::No(t) => t,
            MaybeRc::Rc(t) => t,
        }
    }
}

impl<T> MaybeRc<T> {
    pub(super) fn into_rc(self) -> Rc<T> {
        match self {
            MaybeRc::No(t) => Rc::new(t),
            MaybeRc::Rc(t) => t,
        }
    }
}
