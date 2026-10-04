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
 \new ChordNames \chordmode { e1:m c g b:m e:m c g b:m }
 \new PianoStaff <<
  \new Staff { \key g \major \clef treble
    \bar ".|:" <e' g' b'>1^\markup\small "root" <e' g' c''>^\markup\small "1st" <d' g' b'>^\markup\small "2nd" <d' fis' b'>^\markup\small "1st"
    <e' g' b'>1 <e' g' c''> <d' g' b'> <d' fis' b'> \bar ":|." }
  \new Staff { \key g \major \clef bass
    e1 c g, b, e c g, b, }
 >>
>>
