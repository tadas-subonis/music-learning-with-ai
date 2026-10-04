\version "2.24.3"
#(set-global-staff-size 19)
\paper { line-width = 130\mm indent = 12\mm ragged-right = ##f
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
 \new ChordNames \chordmode { e4:m d c2:maj7 c2:maj7 g1 }
 \new Staff \with { instrumentName = "L.H." } { \key g \major \clef treble
   \set Score.currentBarNumber = #20 \bar ""
   \override TextScript.font-family = #'sans \override TextScript.font-series = #'bold \override TextScript.font-size = #1
   <e' g' b'>4\sustainOn^"T" <d' fis' a'>4^"T" <c' e' g' b'>2~^"T"\sustainOff\sustainOn | \time 2/4 <c' e' g' b'>2^"hold" | \time 4/4 <g d'>1\sustainOff\sustainOn^"T" \bar "||" }
>>
