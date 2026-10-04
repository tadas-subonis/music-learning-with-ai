import os
BASE = os.path.dirname(os.path.abspath(__file__))
import os, subprocess
os.makedirs(BASE+'/ly', exist_ok=True)

HEAD = r'''\version "2.24.3"

#(set-global-staff-size %(size)s)
\paper { line-width = %(width)s\mm indent = 0 ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score \omit BarNumber \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.5 }
  \context { \Lyrics \override LyricText.font-size = #0.5 }
}
'''

def ly(name, body, width=172, size=18):
    src = HEAD % {'width': width, 'size': size} + body
    p = f'{BASE}/ly/{name}.ly'
    open(p, 'w').write(src)
    r = subprocess.run(['lilypond', '-dcrop', '-dno-point-and-click', '-o', f'{BASE}/ly/{name}', p],
                       capture_output=True, text=True)
    if r.returncode:
        print(name, r.stderr[-2000:])
    else:
        w = [l for l in r.stderr.splitlines() if 'warning' in l]
        print(name, 'ok', w)

# ---------- Drill 2: the six chords on the G staircase
ly('staircase', r"""
<<
 \new ChordNames \chordmode { g1 a:m b:m c d e:m fis:dim g }
 \new Staff \with { \remove Time_signature_engraver } { \key g \major \clef treble
   \override Staff.TimeSignature.stencil = ##f
   <g' b' d''>1_\markup\bold "I" <a' c'' e''>_\markup\bold "ii" <b' d'' fis''>_\markup\bold "iii" <c'' e'' g''>_\markup\bold "IV"
   <d'' fis'' a''>_\markup\bold "V" <e'' g'' b''>_\markup\bold "vi"
   \once \override NoteHead.color = #(x11-color 'grey55) \once \override Accidental.color = #(x11-color 'grey55)
   <fis'' a'' c'''>_\markup\italic "(vii°)" <g'' b'' d'''>_\markup\bold "I" \bar "|." }
>>
""", width=165)

# ---------- Drill 3: verse, blocky vs lazy
ly('verse_blocky', r"""
<<
 \new ChordNames \chordmode { e1:m c g b:m }
 \new Staff { \key g \major \clef treble
   <e' g' b'>1 <c' e' g'> <g' b' d''> <b' d'' fis''> \bar "||" }
>>
""", width=150, size=16)

ly('verse_lazy', r"""
<<
 \new ChordNames \chordmode { e1:m c g b:m e:m c g b:m }
 \new PianoStaff <<
  \new Staff { \key g \major \clef treble
    \bar ".|:" <e' g' b'>1^\markup\small "root" <e' g' c''>^\markup\small "1st" <d' g' b'>^\markup\small "2nd" <d' fis' b'>^\markup\small "1st"
    <e' g' b'>1 <e' g' c''> <d' g' b'> <d' fis' b'> \bar ":|." }
  \new Staff { \key g \major \clef bass
    e1 c g, b, e c g, b, }
 >>
>>
""")

# ---------- Drill 4: pre-chorus + chorus
ly('prechorus', r"""
<<
 \new ChordNames \chordmode { c1 g e:m d c g a:m d }
 \new PianoStaff <<
  \new Staff { \key g \major \clef treble
    <e' g' c''>1^\markup\bold "pre-chorus  IV – I – vi – V,  IV – I – ii – V" <d' g' b'> <e' g' b'> <d' fis' a'>
    <e' g' c''> <d' g' b'> <e' a' c''> <d' fis' a'> \bar "||" }
  \new Staff { \key g \major \clef bass
    c1 g, e d c g, a, d }
 >>
>>
""")

ly('chorus', r"""
<<
 \new ChordNames \chordmode { c1 g e:m d c g e:m d c d g }
 \new PianoStaff <<
  \new Staff { \key g \major \clef treble
    <e' g' c''>1^\markup\bold "chorus  IV – I – vi – V" <d' g' b'> <e' g' b'> <d' fis' a'>
    <e' g' c''> <d' g' b'> <e' g' b'> <d' fis' a'> \bar "||"
    <e' g' c''>^\markup\bold "ending  IV – V – I" <d' fis' a'> <d' g' b'> \bar "|." }
  \new Staff { \key g \major \clef bass
    c1 g, e d c g, e d c d g, }
 >>
>>
""")

# ---------- Drill 5: left hand patterns
ly('bass_patterns', r"""
\new Staff { \key g \major \clef bass \time 4/4 \textLengthOn
  e1^\markup\bold "B1 whole" \bar "||"
  e2^\markup\bold "B2 root–5th" b, \bar "||"
  e8^\markup\bold "B3 8th roots" e e e e e e e \bar "||"
  e,8^\markup\bold "B4 root–5–8–5" b, e b, e, b, e b, \bar "||"
  e,8^\markup\bold "B5 octaves" e e, e e, e e, e \bar "|."
}
""")

ly('bass_approach', r"""
<<
 \new ChordNames \chordmode { e1:m c g b:m }
 \new Staff { \key g \major \clef bass
   e2.^\markup\bold "B6 approach notes: beat 4 steps toward the next root" d4 c2. a,4 g,2. a,4 b,2. d4 \bar ":|." }
>>
""", width=150)

# ---------- Drill 6: hands together, RH 3-3-2 over LH quarters
ly('together', r"""
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
""")

# ---------- Drill 7: the push
ly('push', r"""
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
""")

# ---------- Drill 8: broken chords
ly('broken', r"""
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
""")

# ---------- Drill 9: E minor pentatonic + target notes
ly('pentatonic', r"""
<< \new Staff \with { \remove Time_signature_engraver } { \key g \major \clef treble \cadenzaOn
  \new Voice = "p" { e'4 g' a' b' d'' e'' \bar "|" d'' b' a' g' e' \bar "|." } }
  \new Lyrics \lyricsto "p" { E G A B D E D B A G E } >>
""", width=110, size=17)

ly('targets', r"""
<<
 \new ChordNames \chordmode { e1:m c g b:m }
 \new Staff { \key g \major \clef treble \override Staff.TimeSignature.stencil = ##f
   <e' g' b'>1_\markup\small "E G B" <c'' e'' g''>_\markup\small "C E G" <g' b' d''>_\markup\small "G B D" <b' d'' fis''>_\markup\small "B D F♯" \bar "|." }
>>
""", width=110, size=17)

# ---------- cover: rhythm legend (none). Roadmap: none.
