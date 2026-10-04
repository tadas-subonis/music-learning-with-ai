\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 120\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

<<
\new RhythmicStaff \with { \remove Time_signature_engraver } { \new Voice = "r" { \time 4/4 c16 c c c c c c c c c c c c c c c \bar "|." } }
\new Lyrics \lyricsto "r" { "1" "e" "&" "a" "2" "e" "&" "a" "3" "e" "&" "a" "4" "e" "&" "a" }
>>
