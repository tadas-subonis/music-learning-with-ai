\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 130\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

\new Staff \with { \remove Time_signature_engraver } { \key g \major \clef treble \cadenzaOn
  <a' fis''>4^\markup\small "written" <b' g''> \bar "||"
  \ottava #1 <a'' fis'''>4^\markup\small "with 8va: play one octave up" <b'' g'''> \ottava #0 \bar "||"
  <a'' fis'''>4^\markup\small "same keys, written out" <b'' g'''> \bar "|." }
