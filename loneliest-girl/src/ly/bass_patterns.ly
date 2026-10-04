\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 172\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

\new Staff { \key g \major \clef bass \time 4/4 \textLengthOn
  e1^\markup\bold "B1 whole" \bar "||"
  e2^\markup\bold "B2 root–5th" b, \bar "||"
  e8^\markup\bold "B3 8th roots" e e e e e e e \bar "||"
  e,8^\markup\bold "B4 root–5–8–5" b, e b, e, b, e b, \bar "||"
  e,8^\markup\bold "B5 octaves" e e, e e, e e, e \bar "|."
}
