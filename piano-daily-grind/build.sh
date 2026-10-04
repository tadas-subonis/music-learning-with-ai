#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
name="Piano_14_Daily_Grind_V3_BW"

pdflatex -interaction=nonstopmode -halt-on-error "$name.tex"

if [[ -f "$name.mx1" ]]; then
  musixflx "$name.mx1"
fi

pdflatex -interaction=nonstopmode -halt-on-error "$name.tex"
pdflatex -interaction=nonstopmode -halt-on-error "$name.tex"

echo "Built $name.pdf"
