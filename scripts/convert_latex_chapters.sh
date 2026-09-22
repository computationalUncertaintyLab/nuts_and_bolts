#!/usr/bin/env bash
# Convert LaTeX chapters from 2022S_PHDSI_text into MyST markdown for Jupyter Book 2.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="${ROOT}/2022S_PHDSI_text"
OUT="${ROOT}/book/content"

mkdir -p "${OUT}"

convert_one() {
  local rel="$1"
  local src_tex="${SRC}/${rel}.tex"
  local base
  base="$(basename "${rel}")"
  local out_md="${OUT}/${base}.md"

  if [[ ! -f "${src_tex}" ]]; then
    echo "skip missing: ${src_tex}" >&2
    return 0
  fi

  echo "convert ${rel}"

  # Pull the real chapter title before we strip \chapter{...}
  local chapter_title
  chapter_title="$(
    sed -n 's/^\\chapter{\(.*\)}$/\1/p' "${src_tex}" | head -1
  )"
  if [[ -z "${chapter_title}" ]]; then
    chapter_title="${base}"
  fi

  local tmp_tex
  tmp_tex="$(mktemp)"
  # Strip Krantz-only macros; remove duplicate \label{intro} reused on every section.
  sed \
    -e '/^\\chapterauthor/d' \
    -e '/^\\chapter{/d' \
    -e '/^\\hspace/d' \
    -e 's/\\label{intro}//g' \
    -e 's/\\samplespace/\\Omega/g' \
    -e 's/\\text{\([^}]*\)}/\1/g' \
    "${src_tex}" > "${tmp_tex}"

  if ! pandoc "${tmp_tex}" \
    -f latex \
    -t markdown \
    --wrap=none \
    -o "${out_md}" 2>/dev/null; then
    echo "  pandoc failed; retrying with relaxed parser" >&2
    sed -i '' '/^\\end{enumerate}$/d' "${tmp_tex}" 2>/dev/null || sed -i '/^\\end{enumerate}$/d' "${tmp_tex}"
    pandoc "${tmp_tex}" \
      -f latex \
      -t markdown \
      --wrap=none \
      -o "${out_md}" || echo "  FAILED: ${rel}" >&2
  fi
  rm -f "${tmp_tex}"

  if [[ ! -f "${out_md}" ]]; then
    return 0
  fi

  # Prefer PNG figures and rewrite LaTeX-relative paths into book/figures/
  sed -i '' \
    -e 's|](chapters/chapter1/kernelselect)|](../figures/chapter1/kernelselect.png)|g' \
    -e 's|](chapters/chapter1/|](../figures/chapter1/|g' \
    -e 's|](chapters/chapter2/|](../figures/chapter2/|g' \
    -e 's|](chapters/chapter7/|](../figures/chapter7/|g' \
    -e 's|\.pdf)|.png)|g' \
    "${out_md}" 2>/dev/null || sed -i \
    -e 's|](chapters/chapter1/kernelselect)|](../figures/chapter1/kernelselect.png)|g' \
    -e 's|](chapters/chapter1/|](../figures/chapter1/|g' \
    -e 's|](chapters/chapter2/|](../figures/chapter2/|g' \
    -e 's|](chapters/chapter7/|](../figures/chapter7/|g' \
    -e 's|\.pdf)|.png)|g' \
    "${out_md}"

  perl -pi -e '
    s/\{#([\w]+)\.([\w]+)\}/{#$1-$2}/g;
    s/\{#([\w]+):([\w]+)\}/{#$1-$2}/g;
    s/\\mathval\{([^}]*)\}/$1/g;
    s/commandchars="[^"]*"//g;
    # Strip heading attribute leftovers like {#intro}
    s/^(#{1,6}\s+[^\n]*?)\s*\{#[^}]+\}/$1/mg;
  ' "${out_md}"

  # Demote pandoc section headings one level, then prepend the real chapter title.
  python3 - "${out_md}" "${chapter_title}" <<'PY'
import re, sys
from pathlib import Path
path = Path(sys.argv[1])
title = sys.argv[2]
text = path.read_text(encoding="utf-8")
# unwrap ::: {#id} ## Title ::: blocks
text = re.sub(
    r"^:::\s*\{#[^}]+\}\s*\n+(#{1,6}\s+[^\n]+)\s*\n+:::\s*$",
    r"\1",
    text,
    flags=re.M,
)
# demote headings
text = re.sub(
    r"^(#{1,6})\s+(.+)$",
    lambda m: "#" * min(len(m.group(1)) + 1, 6) + " " + m.group(2),
    text,
    flags=re.M,
)
front = f"---\ntitle: {title}\n---\n\n# {title}\n\n"
path.write_text(front + text.lstrip(), encoding="utf-8")
PY
}

# Main matter (order matches phds.tex)
convert_one "chapters/chapter1/1_samplespaceAndPopulation"
convert_one "chapters/chapter2/2_randomvariables"
convert_one "chapters/chapter3/3_probability_dists"
convert_one "chapters/chapter4/4_LLN_MOM"
convert_one "chapters/chapter5/5_LT"
convert_one "chapters/chapter7/7_simple_linear_regression"
convert_one "chapters/chapter6/6_matrix_calculus"
convert_one "chapters/chapter8/logistic_regression"
convert_one "chapters/chapter1/LAB01"
convert_one "chapters/chapter1/LAB02"
convert_one "chapters/Labs/LAB03"
convert_one "chapters/Labs/LAB04"
convert_one "chapters/Labs/LAB05"

echo "Done. Markdown written to ${OUT}"
