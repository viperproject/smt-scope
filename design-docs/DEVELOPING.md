## Local UI (browser)

Start by installing `trunk` with:

```
cargo install trunk
```

Use the following command to build and open the UI in a browser:

```
cd smt-scope-gui && trunk serve --cargo-profile=test --open
```

## Local UI (native)

Install `trunk` as described above, then install `tauri` with:

```
cargo install tauri-cli
```

Use the following command to build and open the UI in a native window:

```
cargo tauri dev
```

## Profiling

Use the following command to profile the program:

```
cargo flamegraph --root --profile=test --bin=smt-scope -- test /path/to/z3.log
```

## Running tests

Run the `parse_logs` test with the following command (or just run `cargo test -- --nocapture`):

```
cargo test --package smt-scope --test parse_logs -- parse_all_logs --exact --show-output --nocapture
```
