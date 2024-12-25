Use the following command to profile the program:

```
cargo flamegraph --root --profile=test --bin=smt-log-parser -- test /path/to/log
```

Run the `parse_logs` test with the following command:

```
cargo test --package smt-log-parser --test parse_logs -- parse_all_logs --exact --show-output --nocapture
```
