\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 172\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

<<
 \new ChordNames \chordmode { e2:m c g b:m }
 \new Staff { \key g \major \clef bass \set Staff.pedalSustainStyle = #'bracket 
   e,16\sustainOn^\markup\small "R 5 8 10 8 5 8 5" b, e g e b, e b,
   c,16\sustainOff\sustainOn g, c e c g, c g,
   g,,16\sustainOff\sustainOn d, g, b, g, d, g, d,
   b,,16\sustainOff\sustainOn fis, b, d b, fis, b, fis, \bar ":|." }
>>
