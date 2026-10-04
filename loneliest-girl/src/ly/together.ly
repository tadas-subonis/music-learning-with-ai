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
  \new Staff = "rh" { \key g \major \clef treble
    \new Voice = "r" { <e' g' b'>4. <e' g' b'>4. <e' g' b'>4
    <e' g' c''>4. <e' g' c''>4. <e' g' c''>4
    <d' g' b'>4. <d' g' b'>4. <d' g' b'>4
    <d' fis' b'>4. <d' fis' b'>4. <d' fis' b'>4 \bar ":|." } }
  \new Lyrics \lyricsto "r" { "1" "2&" "4" "1" "2&" "4" "1" "2&" "4" "1" "2&" "4" }
  \new Staff { \key g \major \clef bass
    e4 e e e c c c c g, g, g, g, b, b, b, b, }
 >>
>>
