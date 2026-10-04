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
 \new ChordNames \chordmode { c1 g e:m d c g e:m d c d g }
 \new PianoStaff <<
  \new Staff { \key g \major \clef treble
    <e' g' c''>1^\markup\bold "chorus  IV – I – vi – V" <d' g' b'> <e' g' b'> <d' fis' a'>
    <e' g' c''> <d' g' b'> <e' g' b'> <d' fis' a'> \bar "||"
    <e' g' c''>^\markup\bold "ending  IV – V – I" <d' fis' a'> <d' g' b'> \bar "|." }
  \new Staff { \key g \major \clef bass
    c1 g, e d c g, e d c d g, }
 >>
>>
