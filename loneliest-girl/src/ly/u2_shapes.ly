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
 \new ChordNames \chordmode { \set majorSevenSymbol = \markup "maj7" c1 g e:m d c:maj7 }
 \new Staff \with { \remove Time_signature_engraver } { \key g \major \clef treble
   <e' g' c''>1_\markup\small "E-G-C" <d' g' b'>_\markup\small "D-G-B" <e' g' b'>_\markup\small "E-G-B" <d' fis' a'>_\markup\small "D-F♯-A" \bar "||"
   <c' e' g' b'>_\markup\small "C-E-G-B" \bar "|." }
>>
