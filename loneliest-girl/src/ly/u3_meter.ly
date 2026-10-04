\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 100\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

<<
\new RhythmicStaff { \time 4/4
  \new Voice = "r" { c1 | \time 2/4 c2 | \time 4/4 c1 \bar "|." } }
\new Lyrics \lyricsto "r" { "1–2–3–4" "1–2" "1–2–3–4" }
>>
