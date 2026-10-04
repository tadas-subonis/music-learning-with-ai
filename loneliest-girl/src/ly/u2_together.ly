\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 150\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

<<
 \new ChordNames \chordmode { c4 c g g e:m e:m d d }
 \new PianoStaff <<
  \new Staff { \key g \major \clef treble
    r8 d''16 d'' d''8 d'' r8 d''16 d'' d''8 d''16 d'' | r8 d''16 d'' d''8 d'' \tuplet 3/2 { d''8 d'' d'' } d''8. d''16 \bar ":|." }
  \new Staff { \key g \major \clef treble
    <e' g' c''>4 q <d' g' b'> q | <e' g' b'> q <d' fis' a'> q }
 >>
>>
