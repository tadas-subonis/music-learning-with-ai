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
 \new ChordNames \chordmode { c2:maj7 g e:m d c g e4:m d c2:maj7 }
 \new Staff \with { instrumentName = "L.H." } { \key g \major \clef treble
   \set Score.currentBarNumber = #17 \bar ""
   \override TextScript.font-family = #'sans \override TextScript.font-series = #'bold \override TextScript.font-size = #1
   <c' e' g' b'>2\sustainOn^"L" <d' g' b'>2\sustainOff\sustainOn^"L" | <e' g' b'>2\sustainOff\sustainOn^"L" <d' fis' a'>4\sustainOff\sustainOn^"T" <d' fis' a'>4^"T" | <e' g' c''>4\sustainOff\sustainOn^"L" <e' g' c''>4^"T" <d' g' b'>4\sustainOff\sustainOn^"L" <d' g' b'>4^"T" | <e' g' b'>4\sustainOff\sustainOn^"T" <d' fis' a'>4^"T" <c' e' g' b'>2\sustainOff\sustainOn^"T"\sustainOff \bar "|" }
>>
