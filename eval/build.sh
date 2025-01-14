DIRNAME="$(realpath "$(dirname "$0")")"
cd "$DIRNAME"

TOOLS="dummy smt-scope axiom-profiler"
for tool in $TOOLS; do
    cd "$DIRNAME/$tool"
    ./build.sh || exit 1
done
