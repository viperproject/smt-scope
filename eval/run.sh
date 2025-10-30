DIRNAME="$(realpath "$(dirname "$0")")"

TOOLS="smt-scope axiom-profiler"
for tool in $TOOLS; do
    RUN="$DIRNAME/$tool/run.sh"
    echo "[tool] $tool"
    "$RUN" "$1" || exit 1
done
