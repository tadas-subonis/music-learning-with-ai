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
 \new ChordNames \chordmode { e2:m c g b:m e:m c g b:m }
 \new Staff { \key g \major \clef treble \set Staff.pedalSustainStyle = #'bracket 
   <e' g' b'>2\sustainOn^\markup\small "root position, as in your bars 5–12" <c' e' g'>\sustainOff\sustainOn
   <g b d'>\sustainOff\sustainOn <b d' fis'>\sustainOff\sustainOn
   <e' g' b'>2\sustainOff\sustainOn <c' e' g'>\sustainOff\sustainOn
   <g b d'>\sustainOff\sustainOn <b d' fis'>\sustainOff\sustainOn \bar ":|." }
>>
