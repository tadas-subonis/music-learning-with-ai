\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 120\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

\new Staff { \key g \major \clef treble
  <e'' e'''>4^\markup\small "1: top line only, octaves" <d'' d'''> <b' b''>2 |
  <e'' g'' e'''>4^\markup\small "2: add one chord tone inside" <d'' g'' d'''> <b' d'' b''>2 \bar "|." }
