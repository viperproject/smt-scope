# Misc. Rust things to note:
- Borrowing an item of a collection will borrow the entire collection, even if you only access one item.
Notably, this makes mutating collection items more difficult in Rust if you have to mutate specific items based on the contents of one item.

    A workaround for this issue is to clone the necessary "pointer" data (IDs) and then modify every needed item (in a loop, if suitable).
Another approach is to use interior mutability with `Rc` and `RefCell` to bypass the borrow-check issue. 
Mutably borrowing different items of the collection is allowed with `Rc<RefCell<T>>`, but there will be a panic if attempting to borrow the same item twice.

- Spawning a thread/some kind of async routine: "Clone before entering block"

    Need to clone references before the closure/block if used before a closure. `move` keyword is probably needed.
Otherwise, the compile error "Borrowed data escapes outside of closure" appears; the references are arguments or of local variables.