#!/usr/bin/env bash
# Fails when raw design values or banned APIs appear in lib/features/** or lib/core/widgets/**.
# Raw values are allowed only in lib/core/theme/**.
# Usage: bash scripts/check_design_tokens.sh [lib_dir]   (default: lib)

set -u
ROOT="${1:-lib}"
TARGETS=()
for d in "$ROOT/features" "$ROOT/core/widgets"; do
  [ -d "$d" ] && TARGETS+=("$d")
done
if [ "${#TARGETS[@]}" -eq 0 ]; then
  echo "check_design_tokens: nothing to scan under '$ROOT'"
  exit 0
fi

fail=0
check() {
  local label="$1" regex="$2" out
  out=$(grep -rnE --include='*.dart' --exclude='*.g.dart' --exclude='*.freezed.dart' \
        -e "$regex" "${TARGETS[@]}" 2>/dev/null)
  if [ -n "$out" ]; then
    echo "✗ $label"
    echo "$out" | sed 's/^/    /'
    fail=1
  fi
}

check "Raw colors (use context.palette.*)"            'Color\(0x|Colors\.'
check "Raw radius (use AppRadius.*)"                   'BorderRadius\.circular\(\s*[0-9]'
check "Numeric EdgeInsets (use AppSpacing/AppInsets)"  'EdgeInsets\.[A-Za-z]+\([^)]*\b[0-9]+(\.[0-9]+)?\b'
check "Numeric SizedBox size (use AppSpacing/AppSizes)" 'SizedBox\([^)]*\b(width|height):\s*[0-9]'
check "Raw TextStyle (use context.text.*)"             'TextStyle\('
check "Raw fontSize"                                   'fontSize:\s*[0-9]'
check "Raw durations (use AppMotion.*)"                'Duration\((milliseconds|seconds):\s*[0-9]'
check "Raw curves (use AppMotion.travel/arrive/feedback)" 'Curves\.'
check "Raw shadows (use theme elevation tokens)"       'BoxShadow\('
check "Navigator API (use GoRouter)"                   'Navigator\.(push|pop|of|maybePop)'
check "Riverpod/Provider/GetX imports"                 "package:(flutter_riverpod|riverpod|hooks_riverpod|provider|get)/"
check "var declarations (use final + explicit type)"   '^\s*var\s'
check "Hand-rolled form controllers"                   'TextEditingController\('

if [ "$fail" -eq 0 ]; then
  echo "✓ design tokens: clean"
else
  echo
  echo "Fix the lines above: move raw values into core/theme/** and read tokens instead."
fi
exit "$fail"
