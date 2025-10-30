export MONO_GC_PARAMS="max-heap-size=12G"
# ulimit -v 12582912

SDIR="$(dirname "$0")"
mono "$SDIR/axiom-profiler/AxiomProfiler.exe" /headless /timing /loops:2147483647 /loopsMs:10000 /showNumChecks /showQuantStatistics /findHighBranching:6 /l:$1
EXIT_CODE=$?
rm -f AxiomProfiler.basic AxiomProfiler.branching AxiomProfiler.loops AxiomProfiler.error
exit $EXIT_CODE
