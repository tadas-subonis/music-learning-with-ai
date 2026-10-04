# The Loneliest Girl (Carole & Tuesday): practice drills

Printable practice material for learning *The Loneliest Girl* on keyboard. All PDFs are A4 and black and white.

## PDFs (`pdf/`)

| File | What it is |
|---|---|
| `1-five-minute-drills.pdf` | Nine general drills built around the song: pulse at 112, the six chords, voice-led shapes, left-hand patterns, hands together, the push, broken chords, melody by ear. Not tied to a specific score. |
| `2-score-drills.pdf` | Units organised by section of the Calary arrangement (easy and normal versions): verse, chorus, intro and ending, then the normal version's arpeggios and two-voice chorus. |
| `3-easy-version-bar-by-bar.pdf` | The current one. Easy version (bars 1–22) in score order, four bars per page: what happens in each bar, the left hand as written with T/L/H meet letters, and seven 5-minute sessions per page. Use it with your own copy of the score open beside it. |

The arrangement itself (Calary, MuseScore) is not included. It's licensed for personal use only, and these drills refer to it by bar number. The right-hand melody is deliberately not reproduced here.

## Sources (`src/`)

- `five-minute-drills.tex`, `score-drills.tex`, `easy-version-bar-by-bar.tex`: XeLaTeX documents
- `kbd.py`: generates the keyboard diagrams (`kbd/*.tex`, TikZ)
- `make_ly.py`, `make_ly2.py`, `make_ly3.py`: generate the LilyPond notation (`ly/*.ly`) and render cropped PDFs (`ly/*.cropped.pdf`)
- `build.sh`: rebuilds everything and copies the results into `pdf/`

The generated `kbd/` and `ly/` files are committed, so the `.tex` files compile without running the Python scripts.

### Build

Requirements: Python 3, LilyPond 2.24, XeLaTeX (TeX Live with `tcolorbox`, `tikz`, `fontspec`, `tabularx`, `enumitem`, `booktabs`), the TeX Gyre Heros font.

```bash
cd loneliest-girl/src
./build.sh
```
