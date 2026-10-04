import os
BASE = os.path.dirname(os.path.abspath(__file__))
import subprocess
HEAD = r'''\version "2.24.3"
#(set-global-staff-size 19)
\paper { line-width = %(width)s\mm indent = 12\mm ragged-right = ##f
  #(define fonts (set-global-fonts #:sans "TeX Gyre Heros" #:roman "TeX Gyre Termes" #:factor (/ staff-height pt 20))) }
\layout {
  \context { \Score barNumberVisibility = #all-bar-numbers-visible
     \override BarNumber.break-visibility = ##(#f #t #t)
     \override BarNumber.font-size = #1 \override BarNumber.font-series = #'bold
     \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8) }
  \context { \ChordNames \override ChordName.font-family = #'sans \override ChordName.font-size = #1.2
     majorSevenSymbol = \markup "maj7" }
  \context { \Staff pedalSustainStyle = #'bracket }
}
'''
def ly(name, start, chords, notes, width=172):
    body = r'''
<<
 \new ChordNames \chordmode { %s }
 \new Staff \with { instrumentName = "L.H." } { \key g \major \clef treble
   \set Score.currentBarNumber = #%d \bar ""
   \override TextScript.font-family = #'sans \override TextScript.font-series = #'bold \override TextScript.font-size = #1
   %s }
>>
''' % (chords, start, notes)
    p = f'{BASE}/ly/{name}.ly'
    open(p, 'w').write(HEAD % {'width': width} + body)
    r = subprocess.run(['lilypond', '-dcrop', '-dno-point-and-click', '-o', f'{BASE}/ly/{name}', p], capture_output=True, text=True)
    print(name, 'ERR' + r.stderr[-1500:] if r.returncode else 'ok')

Em, C, G, Bm = "<e' g' b'>", "<c' e' g'>", "<g b d'>", "<b d' fis'>"
C2, G2, D, Cm7 = "<e' g' c''>", "<d' g' b'>", "<d' fis' a'>", "<c' e' g' b'>"
on, sw = r"\sustainOn", r"\sustainOff\sustainOn"

def m(ch, dur, letter, ped):
    return f'{ch}{dur}{ped}^"{letter}"' if letter else f'{ch}{dur}{ped}'

intro = f'{m(Em,2,"T",on)} {m(C,2,"H",sw)} | {m(G,2,"H",sw)} {m(Bm,2,"H",sw)} | {m(Em,2,"T",sw)} {m(C,2,"H",sw)} | {m(G,2,"H",sw)} {m(Bm,2,"H",sw)}\\sustainOff \\bar "||"'
ly('lh_1_4', 1, 'e2:m c g b:m e:m c g b:m', intro)

v1 = f'{m(Em,2,"L",on)} {m(C,2,"L",sw)} | {m(G,2,"T",sw)} {m(Bm,2,"T",sw)} | {m(Em,2,"L",sw)} {m(C,2,"L",sw)} | {m(G,2,"L",sw)} {m(Bm,2,"T",sw)}\\sustainOff \\bar "|"'
ly('lh_5_8', 5, 'e2:m c g b:m e:m c g b:m', v1)

v2 = f'{m(Em,2,"L",on)} {m(C,2,"L",sw)} | {m(G,2,"H",sw)} {m(Bm,2,"T",sw)} | {m(Em,2,"L",sw)} {m(C,2,"L",sw)} | {m(G,2,"H",sw)} {m(Bm,2,"T",sw)}\\sustainOff \\bar "|"'
ly('lh_9_12', 9, 'e2:m c g b:m e:m c g b:m', v2)

c1 = (f'{m(C2,2,"L",on)} {m(G2,2,"L",sw)} | '
      f'{m(Em,2,"T",sw)} {m(D,4,"H",sw)} {m(D,4,"T","")} | '
      f'{m(C2,4,"L",sw)} {m(C2,4,"T","")} {m(G2,4,"L",sw)} {m(G2,4,"T","")} | '
      f'{m(Em,4,"T",sw)} {m(Em,4,"L","")} {m(D,4,"H",sw)} {m(D,4,"T","")}\\sustainOff \\bar "|"')
ly('lh_13_16', 13, 'c2 g e:m d c g e:m d', c1)

c2 = (f'{m(Cm7,2,"L",on)} {m(G2,2,"L",sw)} | '
      f'{m(Em,2,"L",sw)} {m(D,4,"T",sw)} {m(D,4,"T","")} | '
      f'{m(C2,4,"L",sw)} {m(C2,4,"T","")} {m(G2,4,"L",sw)} {m(G2,4,"T","")} | '
      f'{m(Em,4,"T",sw)} {m(D,4,"T","")} {m(Cm7,2,"T",sw)}\\sustainOff \\bar "|"')
ly('lh_17_20', 17, 'c2:maj7 g e:m d c g e4:m d c2:maj7', c2)

end = (f'{m(Em,4,"T",on)} {m(D,4,"T","")} {Cm7}2~^"T"{sw} | \\time 2/4 {Cm7}2^"hold" | '
       f'\\time 4/4 <g d\'>1\\sustainOff\\sustainOn^"T" \\bar "||"')
ly('lh_20_22', 20, 'e4:m d c2:maj7 c2:maj7 g1', end, width=130)
