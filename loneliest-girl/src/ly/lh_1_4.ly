\version "2.24.3"
#(set-global-staff-size 19)
\paper { line-width = 172\mm indent = 12\mm ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score barNumberVisibility = #all-bar-numbers-visible
     \override BarNumber.break-visibility = ##(#f #t #t)
     \override BarNumber.font-size = #1 \override BarNumber.font-series = #'bold
     \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.2
     majorSevenSymbol = \markup "maj7" }
  \context { \Staff pedalSustainStyle = #'bracket }
}

<<
 \new ChordNames \chordmode { e2:m c g b:m e:m c g b:m }
 \new Staff \with { instrumentName = "L.H." } { \key g \major \clef treble
   \set Score.currentBarNumber = #1 \bar ""
   \override TextScript.font-family = #'sans \override TextScript.font-series = #'bold \override TextScript.font-size = #1
   <e' g' b'>2\sustainOn^"T" <c' e' g'>2\sustainOff\sustainOn^"H" | <g b d'>2\sustainOff\sustainOn^"H" <b d' fis'>2\sustainOff\sustainOn^"H" | <e' g' b'>2\sustainOff\sustainOn^"T" <c' e' g'>2\sustainOff\sustainOn^"H" | <g b d'>2\sustainOff\sustainOn^"H" <b d' fis'>2\sustainOff\sustainOn^"H"\sustainOff \bar "||" }
>>
