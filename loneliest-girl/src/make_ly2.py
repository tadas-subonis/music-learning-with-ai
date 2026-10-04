import os
BASE = os.path.dirname(os.path.abspath(__file__))
import sys
sys.argv = ['x']
exec(open(os.path.join(BASE,'make_ly.py')).read().split('# ---------- Drill 2')[0])

PED = r"\set Staff.pedalSustainStyle = #'bracket "

# ================= UNIT 1: verse
ly('u1_cells', r"""
\new RhythmicStaff \with { \remove Time_signature_engraver } {
  \override Score.RehearsalMark.self-alignment-X = #LEFT
  \time 1/4
  \new Voice = "r" {
  c16^\markup\bold "c1" c c c \bar "||"
  r8^\markup\bold "c2" c16 c \bar "||"
  r16^\markup\bold "c3" c c c \bar "||"
  c16^\markup\bold "c4" c c8 \bar "||"
  c8^\markup\bold "c5" c16 c \bar "||"
  c8.^\markup\bold "c6" c16 \bar "||"
  c16^\markup\bold "c7" c8 c16 \bar "||"
  c8^\markup\bold "c8" c8 \bar "||"
  \time 2/4 c8^\markup\bold "c9 (2 beats)" c8~ c8 c8 \bar "||" } }
""", width=172)

ly('u1_counts', r"""
<<
\new RhythmicStaff \with { \remove Time_signature_engraver } { \new Voice = "r" { \time 4/4 c16 c c c c c c c c c c c c c c c \bar "|." } }
\new Lyrics \lyricsto "r" { "1" "e" "&" "a" "2" "e" "&" "a" "3" "e" "&" "a" "4" "e" "&" "a" }
>>
""", width=120)

ly('u1_lh', r"""
<<
 \new ChordNames \chordmode { e2:m c g b:m e:m c g b:m }
 \new Staff { \key g \major \clef treble """ + PED + r"""
   <e' g' b'>2\sustainOn^\markup\small "root position, as in your bars 5–12" <c' e' g'>\sustainOff\sustainOn
   <g b d'>\sustainOff\sustainOn <b d' fis'>\sustainOff\sustainOn
   <e' g' b'>2\sustainOff\sustainOn <c' e' g'>\sustainOff\sustainOn
   <g b d'>\sustainOff\sustainOn <b d' fis'>\sustainOff\sustainOn \bar ":|." }
>>
""", width=172)

ly('u1_together', r"""
<<
 \new ChordNames \chordmode { e2:m c g b:m }
 \new PianoStaff <<
  \new Staff { \key g \major \clef treble
    \new Voice = "r" { r8 b'16 b' b'8 b' r16 b' b' b' b'4 | b'16 b' b'8 r4 r8 b'16 b' b'8. b'16 \bar ":|." } }
  \new Lyrics \lyricsto "r" { "&" "a" "2" "&" "e" "&" "a" "4" "1" "e" "&" "&" "a" "4" "a" }
  \new Staff { \key g \major \clef treble
    <e' g' b'>2 <c' e' g'> <g b d'> <b d' fis'> }
 >>
>>
""", width=150)

# ================= UNIT 2: chorus
ly('u2_shapes', r"""
<<
 \new ChordNames \chordmode { \set majorSevenSymbol = \markup "maj7" c1 g e:m d c:maj7 }
 \new Staff \with { \remove Time_signature_engraver } { \key g \major \clef treble
   <e' g' c''>1_\markup\small "E-G-C" <d' g' b'>_\markup\small "D-G-B" <e' g' b'>_\markup\small "E-G-B" <d' fis' a'>_\markup\small "D-F♯-A" \bar "||"
   <c' e' g' b'>_\markup\small "C-E-G-B" \bar "|." }
>>
""", width=140)

ly('u2_ledger', r"""
<<
\new Staff \with { \remove Time_signature_engraver } { \key g \major \clef treble \cadenzaOn
  \new Voice = "n" { d''4 e'' fis'' g'' a'' b'' c''' } \bar "|." }
\new Lyrics \lyricsto "n" { D E F♯ G A B C }
>>
""", width=85)

ly('u2_cells', r"""
\new RhythmicStaff \with { \remove Time_signature_engraver } {
  \time 1/4
  \tuplet 3/2 { c8^\markup\bold "c10" c c } \bar "||"
  r8^\markup\bold "c11" c16 c16 \bar "||"
  c16^\markup\bold "c12" c c8 \bar "||"
  c16^\markup\bold "c13" c16 r16 c16 \bar "||"
  r16^\markup\bold "c14" c8.~ c4 \bar "||" }
""", width=110)

ly('u2_together', r"""
<<
 \new ChordNames \chordmode { c4 c g g e:m e:m d d }
 \new PianoStaff <<
  \new Staff { \key g \major \clef treble
    r8 d''16 d'' d''8 d'' r8 d''16 d'' d''8 d''16 d'' | r8 d''16 d'' d''8 d'' \tuplet 3/2 { d''8 d'' d'' } d''8. d''16 \bar ":|." }
  \new Staff { \key g \major \clef treble
    <e' g' c''>4 q <d' g' b'> q | <e' g' b'> q <d' fis' a'> q }
 >>
>>
""", width=150)

# ================= UNIT 3: intro + ending
ly('u3_sixths', r"""
\new Staff \with { \remove Time_signature_engraver } { \key g \major \clef treble \cadenzaOn
  <b g'>4^\markup\small "fingers 1 + 4 (or 1 + 5)" <c' a'> <d' b'> <e' c''> <fis' d''> <g' e''> <a' fis''> <b' g''> \bar "|"
  <a' fis''> <g' e''> <fis' d''> <e' c''> <d' b'> <c' a'> <b g'> \bar "|." }
""", width=150)

ly('u3_8va', r"""
\new Staff \with { \remove Time_signature_engraver } { \key g \major \clef treble \cadenzaOn
  <a' fis''>4^\markup\small "written" <b' g''> \bar "||"
  \ottava #1 <a'' fis'''>4^\markup\small "with 8va: play one octave up" <b'' g'''> \ottava #0 \bar "||"
  <a'' fis'''>4^\markup\small "same keys, written out" <b'' g'''> \bar "|." }
""", width=130)

ly('u3_ties', r"""
<<
\new RhythmicStaff { \time 4/4
  \new Voice = "r" { c16 c8. c16 c8 c16~ c4 c8 c16 c~ | c4 r4 r2 \bar "|." } }
\new Lyrics \lyricsto "r" { "1" "e" "2" "e" "a" "4" "&" "a" }
>>
""", width=120)

ly('u3_meter', r"""
<<
\new RhythmicStaff { \time 4/4
  \new Voice = "r" { c1 | \time 2/4 c2 | \time 4/4 c1 \bar "|." } }
\new Lyrics \lyricsto "r" { "1–2–3–4" "1–2" "1–2–3–4" }
>>
""", width=100)

# ================= UNIT 4: normal verse
ly('u4_bassnotes', r"""
<<
\new Staff \with { \remove Time_signature_engraver } { \key g \major \clef bass \cadenzaOn
  \new Voice = "n" { g,4 b, d fis a \bar "||" a, c e g \bar "||" e, e e' \bar "|." } }
\new Lyrics \lyricsto "n" { G B D F♯ A A C E G E E E }
>>
""", width=130)

ly('u4_arp', r"""
<<
 \new ChordNames \chordmode { e2:m c g b:m }
 \new Staff { \key g \major \clef bass """ + PED + r"""
   e,16\sustainOn^\markup\small "R 5 8 10 8 5 8 5" b, e g e b, e b,
   c,16\sustainOff\sustainOn g, c e c g, c g,
   g,,16\sustainOff\sustainOn d, g, b, g, d, g, d,
   b,,16\sustainOff\sustainOn fis, b, d b, fis, b, fis, \bar ":|." }
>>
""", width=172)

ly('u4_octaves', r"""
\new Staff { \key g \major \clef treble
  <g' g''>8^\markup\small "1 + 5" <a' a''> <b' b''> <c'' c'''> <d'' d'''> <c'' c'''> <b' b''> <a' a''> | <g' g''>2 r2 \bar "|." }
""", width=110)

ly('u4_skeleton', r"""
\new Staff { \key g \major \clef treble
  <e'' e'''>4^\markup\small "1: top line only, octaves" <d'' d'''> <b' b''>2 |
  <e'' g'' e'''>4^\markup\small "2: add one chord tone inside" <d'' g'' d'''> <b' d'' b''>2 \bar "|." }
""", width=120)

# ================= UNIT 5: normal chorus + ending
ly('u5_twovoice', r"""
\new Staff { \key g \major \clef treble
  << { g''8^\markup\small "melody: fingers 3-4-5" a'' b'' a'' g'' a'' g'' fis'' } \\ { <c'' e''>2_\markup\small "hold: fingers 1-2" <b' d''>2 } >> |
  << { r8 a''16 a'' a''8 g'' r8 b''16 a'' a''8 g'' } \\ { <c'' e''>4 e''4 <b' d''>4 d''4 } >> \bar ":|." }
""", width=140)

ly('u5_wide', r"""
<<
 \new ChordNames \chordmode { c2 g e:m d c g e:m d }
 \new Staff { \key g \major \clef bass
   <c c'>2^\markup\small "octaves" <g, g> <e e'> <d d'> |
   <c e'>2^\markup\small "tenths (roll if too wide)" <g, b> <e g'>\arpeggio <d fis'>\arpeggio \bar "|." }
>>
""", width=140)

ly('u5_roll', r"""
\new PianoStaff <<
 \new Staff { \key g \major \clef treble \set PianoStaff.connectArpeggios = ##t
   <b' e'' g''>2\arpeggio <a' d'' fis''>2\arpeggio | <g' b' d'' g''>1\arpeggio \bar "|." }
 \new Staff { \key g \major \clef bass <e b>2\arpeggio <d a>\arpeggio | <g, d g>1\arpeggio }
>>
""", width=110)

ly('u5_run', r"""
\new Staff { \key g \major \clef treble
  g8^\markup\small "slow: 8ths" b d' g' b' d'' g'' r |
  g16^\markup\small "then 16ths" b d' g' b' d'' g'' b'' g''2 \bar "|." }
""", width=120)
