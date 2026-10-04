\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 140\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

\new Staff { \key g \major \clef treble
  << { g''8^\markup\small "melody: fingers 3-4-5" a'' b'' a'' g'' a'' g'' fis'' } \\ { <c'' e''>2_\markup\small "hold: fingers 1-2" <b' d''>2 } >> |
  << { r8 a''16 a'' a''8 g'' r8 b''16 a'' a''8 g'' } \\ { <c'' e''>4 e''4 <b' d''>4 d''4 } >> \bar ":|." }
