"""Rebuild the v2 reference template, then run Pandoc. No output DOCX repairs.
Dependencies: pandoc (or pypandoc_binary) and python-docx.
Run: python3 build-booklet-v2.py
"""
from pathlib import Path
import shutil, subprocess, sys
unit = Path(__file__).resolve().parents[1]
units = unit.parent
subprocess.run([sys.executable, str(units / 'layouts/build-template-v2.py')], check=True)
pandoc = shutil.which('pandoc')
if not pandoc:
    import pypandoc
    pandoc = pypandoc.get_pandoc_path()
subprocess.run([pandoc, str(unit / 'src/booklet-word-processing-software-v2.md'),
    '-o', str(unit / 'booklet-word-processing-software-v2.docx'),
    '--reference-doc=' + str(units / 'booklet_template-v2.docx'),
    '--lua-filter=' + str(units / 'layouts/layouts-v2.lua')], check=True)
print('Built booklet-word-processing-software-v2.docx using versioned inputs.')
