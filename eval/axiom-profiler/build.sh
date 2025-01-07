cd "$(dirname "$0")"
rm -rf axiom-profiler
wget -O axiom-profiler.zip https://github.com/viperproject/axiom-profiler/releases/download/v-2025-01-08-0833/axiom-profiler-release-windows.zip
unzip -d axiom-profiler axiom-profiler.zip
rm -f axiom-profiler.zip
