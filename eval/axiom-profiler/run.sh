export MONO_GC_PARAMS="max-heap-size=12G"
ulimit -v 12582912

EXE="$(dirname "$0")/axiom-profiler/AxiomProfiler.exe"
mono "$EXE" /headless /timing /loops:2147483647 /loopsMs:10000 /showNumChecks /showQuantStatistics /findHighBranching:6 /l:$1 2>&1 | sed "/^wrong line: '  /d"
rm -f AxiomProfiler.basic AxiomProfiler.branching AxiomProfiler.loops AxiomProfiler.error
