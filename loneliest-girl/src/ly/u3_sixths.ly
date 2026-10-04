\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 150\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

\new Staff \with { \remove Time_signature_engraver } { \key g \major \clef treble \cadenzaOn
  <b g'>4^\markup\small "fingers 1 + 4 (or 1 + 5)" <c' a'> <d' b'> <e' c''> <fis' d''> <g' e''> <a' fis''> <b' g''> \bar "|"
  <a' fis''> <g' e''> <fis' d''> <e' c''> <d' b'> <c' a'> <b g'> \bar "|." }
