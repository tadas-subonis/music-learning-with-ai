# Piano Daily Grind

A 14-station, repeatable piano practice system for developing from beginner keyboard skills toward simple pop, lo-fi, and electronic-music composition.

## Current version

**V3 - A4 / black-and-white laser optimized**

Each page is one reusable training station rather than a one-time lesson:

1. Pulse Lock
2. Scale-Degree Engine
3. Interval + Contour Reflexes
4. Triad Machine
5. Voice-Leading Chord Grind
6. Left-Hand Engines
7. Rhythm Independence + Syncopation
8. Motif + Transformation Lab
9. Chord-Tone Melody
10. Contour + Tension Lab
11. Ballad Piano Texture
12. Lo-fi Piano Texture
13. Repetition + Harmonic Rhythm Generator
14. Daily Song Lab

The early pages use note-name support; labels fade as the set progresses. Exercises combine technique, theory, variations, 5-minute routines, self-checks, transfer tests, mastery gates, and return triggers.

## Build

Requires a TeX Live installation with LaTeX Extra, TikZ/tcolorbox, Latin Modern, and MusiXTeX.

```bash
./build.sh
```

The build script runs LaTeX, MusiXTeX spacing, and LaTeX again. Output:

`Piano_14_Daily_Grind_V3_BW.pdf`

## Printing

- Paper: A4
- Orientation: portrait
- Scaling: 100% / actual size
- Printer: designed for black-and-white laser
- Duplex is optional; each page is a standalone station

## Design goal

The long-term target is to be able to sit at a keyboard and reliably:

**choose a key -> choose a progression -> play a stable accompaniment -> invent a recognizable motif -> make a melody follow the harmony -> vary it deliberately -> turn it into a simple arrangement.**

The material is original. The pedagogical backbone draws on practical melody/variation, voice-leading, and harmonic-rhythm ideas from Dennis DeSantis' *Making Music*, with notation/rhythm/scale fundamentals cross-checked against *Open Music Theory*.
