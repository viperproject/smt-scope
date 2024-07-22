# Python Bindings for Axiom Profiler

This crate provides Python bindings for the axiom profiler. Currently, the
provided bindings only enable analysing the branching behaviour as shown in
this [Jupyter notebook](notebooks/analysis.ipynb).

The bindings are developed using [PyO3](https://crates.io/crates/pyo3) crate
and can be built as follows:

```bash
cd py-axiom-profiler

# Create a Python virtual environment. Note: The folder name is critical for
# maturin to automatically pick it up.
python3 -m venv .venv

# Install maturin.
.venv/bin/pip install maturin

# After each change, run:
./.venv/bin/maturin develop
```

You can test the bindings by starting the virtual environment Python
interpreter:

```bash
.venv/bin/python
```

And executing the following commands:

```bash
# Import the library.
import axiom_profiler
# Load the Z3 log.
parser = axiom_profiler.Parser('<path-to-Z3-log-file>')
# Retrieve all instantiations.
all_instantiations = parser.get_all_instantiations()
print("all_instantiations:", len(all_instantiations))
# Retrieve all quantifier instantiations.
all_quantifier_instantiations = parser.get_all_quantifier_instantiations()
first_quantifier_instantiation = all_quantifier_instantiations[0]
print(
    "first_quantifier_instantiation:",
    first_quantifier_instantiation,
    first_quantifier_instantiation.quantifier(),
    first_quantifier_instantiation.instantiation()
)
print("all_quantifier_instantiations:", len(all_quantifier_instantiations))
# Retrieve a specific quantifier.
quantifier = parser.resolve_quantifier('Address$address_constructor$injectivity2$0')
print("quantifier: ", quantifier)
# Compute repeated instantiations and retrieve them.
parser.initialise_repeated_instantiations()
duplicated_terms = parser.get_duplicated_terms()
for (count, term) in duplicated_terms[-10:]:
    print(count, term[:100])
```

