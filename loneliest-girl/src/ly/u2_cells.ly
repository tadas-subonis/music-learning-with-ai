\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 110\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

\new RhythmicStaff \with { \remove Time_signature_engraver } {
  \time 1/4
  \tuplet 3/2 { c8^\markup\bold "c10" c c } \bar "||"
  r8^\markup\bold "c11" c16 c16 \bar "||"
  c16^\markup\bold "c12" c c8 \bar "||"
  c16^\markup\bold "c13" c16 r16 c16 \bar "||"
  r16^\markup\bold "c14" c8.~ c4 \bar "||" }
