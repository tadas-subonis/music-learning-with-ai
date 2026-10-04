\version "2.24.3"

#(set-global-staff-size 17)
\paper { line-width = 110\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

<<
 \new ChordNames \chordmode { e1:m c g b:m }
 \new Staff { \key g \major \clef treble \override Staff.TimeSignature.stencil = ##f
   <e' g' b'>1_\markup\small "E G B" <c'' e'' g''>_\markup\small "C E G" <g' b' d''>_\markup\small "G B D" <b' d'' fis''>_\markup\small "B D F♯" \bar "|." }
>>
