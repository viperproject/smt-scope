use std::cell::RefCell;

use yew::{html::Scope, Callback, Component};

pub struct Updater<T: 'static, O = bool>(Callback<Update<T, O>>);

impl<T: 'static, O> Updater<T, O> {
    /// Called by the global provider on creation, with a callback to update the
    /// provider.
    pub fn new(update: Callback<Update<T, O>>) -> Self {
        Self(update)
    }

    pub fn new_link<G: Component<Message = Update<T, O>>>(link: Scope<G>) -> Self where {
        Self(Callback::from(move |update| link.send_message(update)))
    }

    /// Called by the client to update the provider.
    pub fn update(&self, f: impl for<'a> FnOnce(&'a mut T) -> O + 'static) {
        self.0.emit(Update::new(f));
    }

    pub fn reset(&self) where T: Default + PartialEq, O: From<bool> {
        self.update(|data| {
            let new = Default::default();
            if *data != new {
                *data = new;
                true.into()
            } else {
                false.into()
            }
        });
    }
}

impl<T, O> Clone for Updater<T, O> {
    fn clone(&self) -> Self {
        Self(self.0.clone())
    }

}
impl<T, O> PartialEq for Updater<T, O> {
    fn eq(&self, other: &Self) -> bool {
        self.0 == other.0
    }
}

pub struct Update<T: 'static, O = bool>(Callback<&'static mut T, O>);

impl<T: 'static, O> Update<T, O> {
    fn new(f: impl for<'a> FnOnce(&'a mut T) -> O + 'static) -> Self {
        let f = RefCell::new(Some(f));
        let f = Callback::from(move |data|
            f.borrow_mut().take().unwrap()(data)
        );
        Self(f)
    }

    /// Called by the global provider to apply the update.
    pub fn apply(self, data: &mut T) -> O {
        // SAFETY: the callback can only have been created with a
        // `impl for<'a> FnOnce(&'a mut T) -> O + 'static`, and thus
        // it cannot make use of the `&'static mut T` lifetime.
        let data = unsafe { &mut *(data as *mut _) };
        self.0.emit(data)
    }
}
