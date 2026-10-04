\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 130\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

<<
\new Staff \with { \remove Time_signature_engraver } { \key g \major \clef bass \cadenzaOn
  \new Voice = "n" { g,4 b, d fis a \bar "||" a, c e g \bar "||" e, e e' \bar "|." } }
\new Lyrics \lyricsto "n" { G B D F♯ A A C E G E E E }
>>
