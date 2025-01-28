DIRNAME="$(realpath "$(dirname "$0")")"

VERSION=${2:-"unknown"}
mkdir -p "$DIRNAME/data_other/github/$VERSION"
cd "$DIRNAME/data_other/github/$VERSION"
gh run download $1

# Extract all downloaded artifacts (e.g. at `carbon-1/carbon-1.tar.bz2`)
ALL=$(find . -name '*.tar.bz2')
for file in $ALL; do
    tar -xjf $file
    rm -rf $(dirname $file)
done

mv eval/data/* .
rm -rf eval
