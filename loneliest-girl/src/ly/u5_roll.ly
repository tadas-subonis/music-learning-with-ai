\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 110\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

\new PianoStaff <<
 \new Staff { \key g \major \clef treble \set PianoStaff.connectArpeggios = ##t
   <b' e'' g''>2\arpeggio <a' d'' fis''>2\arpeggio | <g' b' d'' g''>1\arpeggio \bar "|." }
 \new Staff { \key g \major \clef bass <e b>2\arpeggio <d a>\arpeggio | <g, d g>1\arpeggio }
>>
