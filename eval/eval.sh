DIRNAME="$(realpath "$(dirname "$0")")"
mkdir -p "$DIRNAME/data"

SMT2_DIR="$DIRNAME/smt-logs-smt2/smt2"

# If $1 is set search in "$SMT2_DIR/$1" else search in "$SMT2_DIR"
SEARCH_DIR="$SMT2_DIR"
[ -n "$1" ] && SEARCH_DIR="$SMT2_DIR/$1"
[ -d "$SEARCH_DIR" ] || exit 1
SMT2_FILES="$(find "$SEARCH_DIR" -name "*.smt2")"

while read -r file; do
    # [ "${file#"$SMT2_DIR/"}" == "fstar/examples/preorders/queries-Ariadne.smt2" ] || continue
    cd "$DIRNAME/data"
    "$SMT2_DIR/z3.sh" "$file"

    FILE="${file#"$SMT2_DIR/"}"
    OUTPUT="$DIRNAME/data/${FILE%.*}"
    OUTPUT_DIR="$(dirname "$OUTPUT")"
    LOGFILE="$(find "$OUTPUT_DIR" -name "$(basename "$OUTPUT")-fHash-*.log" -maxdepth 1 -type f)"
    [ -n "$LOGFILE" ] || exit 1
    [ -s "$LOGFILE" ] || exit 1
    cd "$OUTPUT_DIR"

    echo "\n[LOGFILE] $(basename "$LOGFILE") $(ls -l "$LOGFILE" | awk '{print $5}')b" > "$OUTPUT.data"
    "$DIRNAME/run.sh" "$LOGFILE" >> "$OUTPUT.data"

    rm -f "$LOGFILE"
done <<< "$SMT2_FILES"

# > Z3_EXE="~/Downloads/z3-4.8.7-x64-osx-10.14.6/bin/z3" ./eval/eval.sh
