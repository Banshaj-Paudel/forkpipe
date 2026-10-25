#!/usr/bin/env bash
# Fails if production files contain banned wording or placeholders.
cd "$(dirname "$0")/.." || exit 1
files=$(find . -name '*.html' -not -path './.git/*')
fail=0
check() {
  if grep -InEi -- "$1" $files; then echo "FAIL: $2"; fail=1; fi
}
check 'guaranteed|#1|\bbest\b|\bleading\b|top-rated|\bproven\b|10x|trusted by|as seen in|our clients|our customers|case study|award-winning|\bcertified\b|limited spots|only .* left|\bunlock|supercharge|game-changing|revolutioniz|seamless|cutting-edge|\belevate\b|\bleverag|\bdelve' 'banned words'
check '—|&mdash;' 'em dash'
check '\[ASK|TODO|lorem' 'placeholder'
check 'hookx|all builders welcome' 'excluded topic'
for f in $files; do
  grep -q '<title>' "$f" || { echo "FAIL: no title in $f"; fail=1; }
  grep -q 'name="description"' "$f" || { echo "FAIL: no description in $f"; fail=1; }
done
[ $fail -eq 0 ] && echo "OK: all checks passed"
exit $fail
