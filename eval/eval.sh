DIRNAME="$(realpath "$(dirname "$0")")"
mkdir -p "$DIRNAME/data"

SMT2_DIR="$DIRNAME/smt-logs/smt2"

# If $1 is set search in "$SMT2_DIR/$1" else search in "$SMT2_DIR"
SEARCH_DIR="$SMT2_DIR"
[ -n "$1" ] && SEARCH_DIR="$SMT2_DIR/$1"
[ -d "$SEARCH_DIR" ] || exit 1
SMT2_FILES="$(find "$SEARCH_DIR" -name "*.smt2" | sort)"

# Set the timeout for running z3, limits log size to about 0.5GB
export TIMEOUT=5

while read -r file; do
    FILE="${file#"$SMT2_DIR/"}"
    OUTPUT="$DIRNAME/data/${FILE%.*}"

    [[ "$2" == "lt" && "$3" < "$FILE" ]] && continue || true
    [[ "$2" == "gt" && "$3" > "$FILE" ]] && continue || true
    [[ "$2" == "eq" && "${FILE#"$3/"}" == "${FILE}" ]] && continue || true
    [ -s "$OUTPUT.data" ] && echo "[.log] EXISTS $FILE" && continue || true

    # [ "$FILE" == "silicon/silver/src/test/resources/quantifiedpermissions/misc/functions-01.smt2" ] || continue
    cd "$DIRNAME/data"
    "$SMT2_DIR/z3.sh" "$file"

    OUTPUT_DIR="$(dirname "$OUTPUT")"
    LOGFILE="$(find "$OUTPUT_DIR" -name "$(basename "$OUTPUT")-fHash-*.log" -maxdepth 1 -type f)"
    [ ! -n "$LOGFILE" ] && echo "!!! No logfile found" && continue || true
    [ ! -s "$LOGFILE" ] && echo "!!! Log file is empty for \"$FILE\"" && continue || true
    cd "$OUTPUT_DIR"

    echo "[LOGFILE] $(basename "$LOGFILE") $(ls -l "$LOGFILE" | awk '{print $5}')b" > "$OUTPUT.data"
    "$DIRNAME/run.sh" "$LOGFILE" >> "$OUTPUT.data"

    rm -f "$LOGFILE"
done <<< "$SMT2_FILES"

# > Z3_EXE="$HOME/Downloads/ViperToolsMacARM/z3/bin/z3" ./eval/eval.sh
