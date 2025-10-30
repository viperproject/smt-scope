cd "$(dirname "$0")"
wget --no-verbose -O axiom-profiler.zip https://github.com/viperproject/axiom-profiler/releases/download/v-2025-01-13-0958/axiom-profiler-release-windows.zip
rm -rf axiom-profiler
unzip -d axiom-profiler axiom-profiler.zip
rm -f axiom-profiler.zip
