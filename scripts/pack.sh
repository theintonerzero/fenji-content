#!/usr/bin/env bash
# Builds the content pack, fenji-content-<version>.tar.gz, in fenji-pack's format 1: a gzipped tar
# of manifest.json, glossary.tsv and text/<language>/<area>.tsv, each a regular file.
#
#   scripts/pack.sh VERSION [OUT_DIR]     VERSION is the tag (v1.0.0); OUT_DIR defaults to dist/
#
# It refuses what Fenji's launcher would: a file with a name the format doesn't have; any file
# holding CJK (no Chinese is ever in this repository); a text file's line that isn't
# <32 lowercase hex> TAB <English>, whose English has an escape other than \\ \t \n \r; lines out of
# strictly increasing fingerprint order; and a fingerprint in two files.
set -euo pipefail
export LC_ALL=C.UTF-8

die() { echo "pack.sh: $*" >&2; exit 1; }
[ $# -ge 1 ] && [ $# -le 2 ] || die "usage: scripts/pack.sh VERSION [OUT_DIR]"
version=$1
[[ $version =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]] || die "the version is a tag such as v1.0.0, not $version"
build=10015727
root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)
out=$(mkdir -p -- "${2:-$root/dist}" && cd -- "${2:-$root/dist}" && pwd -P)
cd -- "$root"

texts=()
while IFS= read -r f; do texts+=("$f"); done < <(find text -type f -name '*.tsv' | LC_ALL=C sort)
files=()
if [ -f glossary.tsv ]; then files+=(glossary.tsv); fi
files+=("${texts[@]}")

for f in "${files[@]}"; do
  [[ $f =~ ^(glossary\.tsv|text/[a-z0-9_-]+/[a-z0-9_-]+\.tsv)$ ]] || die "$f: a name the format doesn't have"
  if grep -qP '[\x{2E80}-\x{2FDF}\x{3000}-\x{303F}\x{3040}-\x{30FF}\x{3400}-\x{4DBF}\x{4E00}-\x{9FFF}\x{F900}-\x{FAFF}\x{FF00}-\x{FFEF}]' -- "$f"; then
    die "$f holds CJK"
  fi
done

lines=0
for f in "${texts[@]}"; do
  n=$(awk -F'\t' -v file="$f" '
    function refuse(why) { printf "pack.sh: %s:%d: %s\n", file, NR, why > "/dev/stderr"; bad = 1; exit 1 }
    {
      if (index($0, "\r")) refuse("a raw carriage return")
      if (NF != 2) refuse("not one fingerprint, one tab and the English")
      if ($1 !~ /^[0-9a-f]+$/ || length($1) != 32) refuse("not a fingerprint: " $1)
      if (NR > 1 && $1 <= prev) refuse("out of order, or twice: " $1)
      rest = $2
      gsub(/\\[\\tnr]/, "", rest)
      if (index(rest, "\\")) refuse("an escape other than \\\\ \\t \\n \\r")
      prev = $1
    }
    END { if (!bad) print NR }' "$f") || exit 1
  lines=$((lines + n))
done
if [ "${#texts[@]}" -gt 0 ]; then
  twice=$(cut -f1 -- "${texts[@]}" | LC_ALL=C sort | uniq -d | head -n 1)
  [ -z "$twice" ] || die "$twice is in two files"
fi

stage=$(mktemp -d)
trap 'rm -rf -- "$stage"' EXIT
{
  printf '{\n  "format": 1,\n  "build": "%s",\n  "version": "%s",\n  "lines": %d,\n  "files": {' "$build" "$version" "$lines"
  sep=""
  for f in "${files[@]}"; do
    printf '%s\n    "%s": "%s"' "$sep" "$f" "$(sha256sum -- "$f" | cut -d' ' -f1)"
    sep=","
  done
  if [ "${#files[@]}" -gt 0 ]; then printf '\n  '; fi
  printf '}\n}\n'
} > "$stage/manifest.json"

pack="$out/fenji-content-$version.tar.gz"
tar --format=gnu --no-recursion --owner=0 --group=0 --numeric-owner --mtime=@0 --mode=0644 \
  -cf - -C "$stage" manifest.json -C "$root" "${files[@]}" | gzip -n -9 > "$pack"
echo "$pack: $lines lines in ${#texts[@]} text files"
