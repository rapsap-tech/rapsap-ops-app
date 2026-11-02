"""Regenerate docs/figma/frames/*.md from metadata.xml.

Usage: python3 docs/figma/generate_frames.py docs/figma/metadata.xml docs/figma/frames docs/figma/screenshots
"""
import re, sys, os, html
src, outdir, shots = sys.argv[1], sys.argv[2], sys.argv[3]
s = open(src).read()
tags = list(re.finditer(r'<(/?)(\w+)([^>]*?)(/?)>', s))
noise = {'Container', 'Background', 'Html → Body', 'Margin', 'SVG', 'Vector'}
frames = []  # (name, id, lines)
depth = 0
current = None
base = 0
for m in tags:
    close, tag, attrs, selfc = m.groups()
    if close:
        depth -= 1
        if current and depth == base:
            frames.append(current); current = None
        continue
    a = dict(re.findall(r'(\w+)="([^"]*)"', attrs))
    if depth == 1 and tag in ('frame', 'section') and current is None:
        current = {'name': html.unescape(a.get('name', '')), 'id': a.get('id'), 'w': a.get('width'), 'h': a.get('height'), 'lines': []}
        base = depth
    elif current is not None:
        name = html.unescape(a.get('name', ''))
        ind = '  ' * (depth - base - 1)
        geo = f"x{float(a.get('x',0)):.0f} y{float(a.get('y',0)):.0f} · {float(a.get('width',0)):.0f}×{float(a.get('height',0)):.0f}"
        if tag == 'text':
            current['lines'].append(f'{ind}- "{name}" ({geo})')
        elif name not in noise:
            current['lines'].append(f'{ind}- [{tag}] {name} ({geo})')
    if not selfc:
        depth += 1
shotfiles = {f.split('_')[0]: f for f in os.listdir(shots)}
index = []
for f in frames:
    if f['name'] == 'Html → Body':
        f['name'] = 'Settings (unnamed frame "Html → Body")'
    code = f['name'].split(' ')[0]
    slug = re.sub(r'[^A-Za-z0-9]+', '_', f['name'].split(' (')[0]).strip('_')
    fn = f'{slug}_{f["id"].replace(":", "-")}.md'
    shot = [v for k, v in sorted(shotfiles.items()) if k == code]
    body = [f'# {f["name"]}', '', f'- Figma node: `{f["id"]}` · frame {f["w"]}×{f["h"]} (design size 390×844)']
    if shot:
        body.append(f'- Screenshot: [../screenshots/{shot[0]}](../screenshots/{shot[0]})')
    body += ['', 'Layout tree from the Figma file (positions are relative to the parent; Container/Background wrappers omitted). Texts are quoted exactly.', '']
    pad = min((len(l) - len(l.lstrip()) for l in f['lines']), default=0)
    body += [l[pad:] for l in f['lines']]
    open(os.path.join(outdir, fn), 'w').write('\n'.join(body) + '\n')
    index.append((f['name'], f['id'], fn, bool(shot)))
print(len(frames))
