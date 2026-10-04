\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 150\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

<<
 \new ChordNames \chordmode { e1:m c g b:m }
 \new Staff { \key g \major \clef bass
   e2.^\markup\bold "B6 approach notes: beat 4 steps toward the next root" d4 c2. a,4 g,2. a,4 b,2. d4 \bar ":|." }
>>
