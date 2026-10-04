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
 \new ChordNames \chordmode { e1:m c g b:m }
 \new PianoStaff <<
  \new Staff { \key g \major \clef treble
    e'8 g' b' g' e' g' b' g'
    e' g' c'' g' e' g' c'' g'
    d' g' b' g' d' g' b' g'
    d' fis' b' fis' d' fis' b' fis' \bar ":|." }
  \new Staff { \key g \major \clef bass
    e1\sustainOn c\sustainOff\sustainOn g,\sustainOff\sustainOn b,\sustainOff\sustainOn }
 >>
>>
