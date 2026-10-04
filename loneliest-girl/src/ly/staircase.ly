\version "2.24.3"

#(set-global-staff-size 18)
\paper { line-width = 165\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}

<<
 \new ChordNames \chordmode { g1 a:m b:m c d e:m fis:dim g }
 \new Staff \with { \remove Time_signature_engraver } { \key g \major \clef treble
   \override Staff.TimeSignature.stencil = ##f
   <g' b' d''>1_\markup\bold "I" <a' c'' e''>_\markup\bold "ii" <b' d'' fis''>_\markup\bold "iii" <c'' e'' g''>_\markup\bold "IV"
   <d'' fis'' a''>_\markup\bold "V" <e'' g'' b''>_\markup\bold "vi"
   \once \override NoteHead.color = #(x11-color 'grey55) \once \override Accidental.color = #(x11-color 'grey55)
   <fis'' a'' c'''>_\markup\italic "(vii°)" <g'' b'' d'''>_\markup\bold "I" \bar "|." }
>>
