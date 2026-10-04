#!/usr/bin/env bash
# Build Five-Minute-Piano-Drills.pdf from drills.lytex.
# Needs: LilyPond (lilypond-book) and XeLaTeX with tcolorbox, tikz, tabularx,
# booktabs, colortbl, multirow, amsmath, enumitem; fonts TeX Gyre Heros and TeX Gyre Pagella.
set -euo pipefail
cd "$(dirname "$0")"
rm -rf out
lilypond-book --pdf --latex-program=xelatex --output=out drills.lytex
cp preamble.tex out/
(cd out && xelatex -interaction=nonstopmode drills.tex >/dev/null)
cp out/drills.pdf Five-Minute-Piano-Drills.pdf
echo "Built Five-Minute-Piano-Drills.pdf"
