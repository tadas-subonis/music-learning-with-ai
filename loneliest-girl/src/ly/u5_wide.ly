\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 140\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

<<
 \new ChordNames \chordmode { c2 g e:m d c g e:m d }
 \new Staff { \key g \major \clef bass
   <c c'>2^\markup\small "octaves" <g, g> <e e'> <d d'> |
   <c e'>2^\markup\small "tenths (roll if too wide)" <g, b> <e g'>\arpeggio <d fis'>\arpeggio \bar "|." }
>>
