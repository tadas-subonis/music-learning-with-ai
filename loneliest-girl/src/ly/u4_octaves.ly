\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 110\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

\new Staff { \key g \major \clef treble
  <g' g''>8^\markup\small "1 + 5" <a' a''> <b' b''> <c'' c'''> <d'' d'''> <c'' c'''> <b' b''> <a' a''> | <g' g''>2 r2 \bar "|." }
