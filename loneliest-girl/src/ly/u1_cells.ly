\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 172\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

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
