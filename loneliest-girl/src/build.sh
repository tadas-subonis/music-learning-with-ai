#!/usr/bin/env bash
# Rebuild all three PDFs. Needs: python3, lilypond (2.24), xelatex with
# tcolorbox/tikz/fontspec, and the TeX Gyre Heros font.
set -euo pipefail
cd "$(dirname "$0")"

python3 kbd.py          # keyboard diagrams -> kbd/*.tex
python3 make_ly.py      # notation for five-minute-drills
python3 make_ly2.py     # notation for score-drills
python3 make_ly3.py     # left-hand parts for easy-version-bar-by-bar

for doc in five-minute-drills score-drills easy-version-bar-by-bar; do
  xelatex -interaction=nonstopmode "$doc.tex" > /dev/null
done

mkdir -p ../pdf
cp five-minute-drills.pdf      ../pdf/1-five-minute-drills.pdf
cp score-drills.pdf            ../pdf/2-score-drills.pdf
cp easy-version-bar-by-bar.pdf ../pdf/3-easy-version-bar-by-bar.pdf
rm -f ./*.aux ./*.log ./*.pdf
echo "Done: ../pdf/"
