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
    \new Voice = "r" {
    <e' g' b'>2. r8 <e' g' c''>8~ |
    <e' g' c''>2. r8 <d' g' b'>8~ |
    <d' g' b'>2. r8 <d' fis' b'>8~ |
    <d' fis' b'>2. r8 <e' g' b'>8 \bar ":|." } }
  \new Lyrics \lyricsto "r" { "1" "4&" "4&" "4&" "4&" }
  \new Staff { \key g \major \clef bass
    e2 e c2 c g,2 g, b,2 b, }
 >>
>>
