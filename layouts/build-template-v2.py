"""Reproducibly derive the v2 reference template from the unchanged original.
All visual styles belong here, not in generated booklet repair code.
"""
from pathlib import Path
from docx import Document
from docx.shared import Pt
from docx.enum.style import WD_STYLE_TYPE
from docx.oxml import OxmlElement
from docx.oxml.ns import qn
units = Path(__file__).resolve().parents[1]
doc = Document(units / 'booklet_template.docx')
# The original lacks Pandoc's Compact paragraph style. Define it explicitly:
# unresolved Compact caused misplaced table text in the LibreOffice renderer.
for name in ['Compact', 'EvidenceSpace']:
    style = doc.styles[name] if name in doc.styles else doc.styles.add_style(name, WD_STYLE_TYPE.PARAGRAPH)
    style.base_style = doc.styles['Normal']
    style.font.size = Pt(14)
    style.paragraph_format.space_before = Pt(0)
    style.paragraph_format.space_after = Pt(3 if name == 'Compact' else 0)
    style.paragraph_format.line_spacing = 1.0 if name == 'Compact' else Pt(20)
    style.paragraph_format.keep_with_next = False
    style.paragraph_format.keep_together = True
# Muted but readable helper text belongs inside the response cell.
hint = doc.styles['EvidenceHint'] if 'EvidenceHint' in doc.styles else doc.styles.add_style('EvidenceHint', WD_STYLE_TYPE.PARAGRAPH)
hint.base_style = doc.styles['Normal']
hint.font.size = Pt(14)
hint.font.italic = True
from docx.shared import RGBColor
hint.font.color.rgb = RGBColor.from_string('475569')
hint.paragraph_format.space_before = Pt(0)
hint.paragraph_format.space_after = Pt(4)
hint.paragraph_format.keep_with_next = True
hint.paragraph_format.keep_together = True
# PNG cover styling: one plain bordered panel, no inner rules or shading.
from docx.enum.text import WD_ALIGN_PARAGRAPH
from copy import deepcopy
for name in ['CoverFrame', 'CoverDates']:
    style = doc.styles[name] if name in doc.styles else doc.styles.add_style(name, WD_STYLE_TYPE.TABLE)
    style.base_style = doc.styles['Normal Table']
    props = OxmlElement('w:tblPr')
    borders = OxmlElement('w:tblBorders')
    for edge in ['top','left','bottom','right','insideH','insideV']:
        border = OxmlElement('w:' + edge)
        border.set(qn('w:val'), 'single' if name == 'CoverDates' or edge not in ['insideH','insideV'] else 'nil')
        border.set(qn('w:sz'), '4'); border.set(qn('w:color'), '000000')
        borders.append(border)
    props.append(borders)
    margins = OxmlElement('w:tblCellMar')
    for side in ['top','left','bottom','right']:
        margin = OxmlElement('w:' + side)
        margin.set(qn('w:w'), '100' if name == 'CoverDates' else '140')
        margin.set(qn('w:type'), 'dxa'); margins.append(margin)
    props.append(margins); style.element.append(props)
    if name == 'CoverDates':
        first = OxmlElement('w:tblStylePr'); first.set(qn('w:type'), 'firstRow')
        run_props = OxmlElement('w:rPr'); run_props.append(OxmlElement('w:b'))
        first.append(run_props); style.element.append(first)
# Paragraph styles keep cover content in order within the frame.
for name, size, bold, before, after in [
    ('CoverName',22,False,18,18),
    ('CoverQualification',24,False,0,0),
    ('CoverCode',24,True,0,24),
    ('CoverUnitTitle',24,True,0,18),
    ('CoverArtwork',14,False,42,105)]:
    style = doc.styles.add_style(name, WD_STYLE_TYPE.PARAGRAPH)
    style.base_style = doc.styles['Normal']
    style.font.name = 'Arial'; style.font.size = Pt(size); style.font.bold = bold
    pf = style.paragraph_format
    pf.alignment = WD_ALIGN_PARAGRAPH.LEFT if name == 'CoverName' else WD_ALIGN_PARAGRAPH.CENTER
    pf.space_before = Pt(before); pf.space_after = Pt(after); pf.line_spacing = 1.0
    pf.keep_with_next = name != 'CoverArtwork'; pf.keep_together = True
# Provide a genuine Word title property field, not a stale [Title] control.
# Lua maps the booklet's YAML title to Subject to avoid an automatic cover block.
for section in doc.sections:
    for t in list(section.header._element.iter(qn('w:t'))):
        if t.text == '[Title]':
            run = t.getparent()
            field = OxmlElement('w:fldSimple')
            field.set(qn('w:instr'), ' DOCPROPERTY Subject ')
            field.set(qn('w:dirty'), 'true')
            run.getparent().replace(run, field)
            field.append(run)
            t.text = 'Word Processing Software (D/505/6398)'
# Request field refresh when opened; the v2 reference is shared in structure,
# with a meaningful cached title for this first unit.
settings = doc.settings.element
existing = settings.find(qn('w:updateFields'))
if existing is None:
    existing = OxmlElement('w:updateFields'); settings.append(existing)
existing.set(qn('w:val'), 'true')
doc.save(units / 'booklet_template-v2.docx')
print('Built booklet_template-v2.docx from the original template.')
