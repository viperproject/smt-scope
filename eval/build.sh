DIRNAME="$(realpath "$(dirname "$0")")"

cd "$DIRNAME"
rm -rf smt-logs-smt2
wget -O smt-logs.tar.gz https://github.com/viperproject/smt-logs/archive/refs/heads/smt2.tar.gz
tar -xvf smt-logs.tar.gz
rm -f smt-logs.tar.gz

TOOLS="smt-scope axiom-profiler"
for tool in $TOOLS; do
    cd "$DIRNAME/$tool"
    ./build.sh || exit 1
done
