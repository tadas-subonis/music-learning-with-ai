import os
BASE = os.path.dirname(os.path.abspath(__file__))
import os
os.makedirs(BASE+'/kbd', exist_ok=True)
WHITE = {0, 2, 4, 5, 7, 9, 11}
NAMES = {'C':0,'D':2,'E':4,'F':5,'G':7,'A':9,'B':11}

def midi(n):
    # 'F#4' -> midi
    letter = n[0]; acc = 1 if '#' in n else (-1 if 'b' in n[1:-1] else 0)
    octv = int(n[-1])
    return 12*(octv+1) + NAMES[letter] + acc

def kbd(name, start, end, marks, roots=(), ww=3.3, wh=15, bw=2.0, bh=9.5):
    """marks: dict note->label; roots: notes that get a triangle."""
    s, e = midi(start), midi(end)
    whites = [m for m in range(s, e+1) if m % 12 in WHITE]
    xw = {m: i*ww for i, m in enumerate(whites)}
    out = [r'\begin{tikzpicture}[x=1mm,y=1mm,line width=0.35pt]']
    for m, x in xw.items():
        out.append(rf'\draw ({x},0) rectangle ({x+ww},{wh});')
    blacks = {}
    for m in range(s, e+1):
        if m % 12 not in WHITE and (m-1) in xw:
            x = xw[m-1] + ww - bw/2
            blacks[m] = x
            out.append(rf'\fill ({x},{wh-bh}) rectangle ({x+bw},{wh});')
    mk = {midi(k): v for k, v in marks.items()}
    for m, lab in mk.items():
        if m in xw:
            cx, cy = xw[m] + ww/2, 2.3
            out.append(rf'\fill ({cx},{cy}) circle (1.45);')
            out.append(rf'\node[text=white,font=\sffamily\bfseries\fontsize{{5.5}}{{6}}\selectfont] at ({cx},{cy}) {{{lab}}};')
        else:
            cx, cy = blacks[m] + bw/2, wh-bh+2.0
            out.append(rf'\filldraw[fill=white,draw=white] ({cx},{cy}) circle (1.0);')
            out.append(rf'\node[text=black,font=\sffamily\bfseries\fontsize{{4.5}}{{5}}\selectfont] at ({cx},{cy}) {{{lab}}};')
    for r in roots:
        m = midi(r)
        cx = (xw[m] + ww/2) if m in xw else blacks[m] + bw/2
        out.append(rf'\fill ({cx-1.1},-2.6) -- ({cx+1.1},-2.6) -- ({cx},-0.8) -- cycle;')
    out.append(r'\end{tikzpicture}')
    open(f'{BASE}/kbd/{name}.tex', 'w').write('\n'.join(out))

kbd('legend', 'C4', 'B4', {'C4': '1', 'E4': '3', 'G4': '5'}, roots=['C4'])
chords = {
    'Em': ['E4', 'G4', 'B4'], 'C': ['C4', 'E4', 'G4'], 'G': ['G4', 'B4', 'D5'],
    'Bm': ['B3', 'D4', 'F#4'], 'D': ['D4', 'F#4', 'A4'], 'Am': ['A3', 'C4', 'E4'],
}
for n, notes in chords.items():
    kbd('ch_'+n, 'A3', 'E5', dict(zip(notes, ['R', '3', '5'])), roots=[notes[0]])
# thirds
kbd('maj3', 'C4', 'A4', {'C4': 'R', 'E4': '3'}, roots=['C4'])
kbd('min3', 'C4', 'A4', {'E4': 'R', 'G4': '3'}, roots=['E4'])
# scale G major + pentatonic
kbd('gmajor', 'F4', 'A5', {'G4':'1','A4':'2','B4':'3','C5':'4','D5':'5','E5':'6','F#5':'7','G5':'1'}, roots=['G4','G5'])
kbd('epenta', 'D4', 'F5', {'E4':'E','G4':'G','A4':'A','B4':'B','D5':'D','E5':'E'}, roots=['E4','E5'])
print('ok')
