# Reproducible v2 booklet generation

The original `layouts.lua`, `booklet_template.docx` and v1 resources are unchanged.

## Build

Install Pandoc (or the Python `pypandoc_binary` package) and `python-docx`, then run from the repository root:

```sh
python3 "Units/Word processing software/src/build-booklet-v2.py"
```

The build first runs `layouts/build-template-v2.py` to derive `booklet_template-v2.docx` from the original reference template. It then runs Pandoc with the v2 Markdown, `layouts/layouts-v2.lua` and that v2 reference template. No repair step changes the generated booklet.

Equivalent Pandoc command, after generating the reference template:

```sh
pandoc "Units/Word processing software/src/booklet-word-processing-software-v2.md" \
  --reference-doc=Units/booklet_template-v2.docx \
  --lua-filter=Units/layouts/layouts-v2.lua \
  -o "Units/Word processing software/booklet-word-processing-software-v2.docx"
```

## Fixes and responsibilities

- Lua owns layout transformations: shared table classes, metadata table widths, page breaks, and body heading mapping.
- The cover follows `example_front_p1_1.png` and `example_front_p1_2.png`: logo above a single bordered `layout-cover` panel containing student name, qualification, unit code, unit title and artwork. The sole layout change is `layout-cover-dates`: four column headings and one blank data row. `CoverFrame`, `CoverDates` and cover paragraph styles are defined in the template builder. No repeated title block or banner is added.
- With `cover-layout: png`, Lua moves YAML title into DOCX subject metadata and removes title/subtitle metadata before writing. This prevents Pandoc's automatic title block outside the cover panel. The running header reads DOCPROPERTY Subject; the visible unit title is rendered once inside the panel. The metadata title property is consequently empty; the meaningful title remains in the subject property and filename.
- The original reference lacks Pandoc's `Compact` paragraph style. The v2 reference defines it explicitly, keeping table text inside cells in the renderer used for checks.
- Response boxes retain their Markdown helper text using the template’s `EvidenceHint` style. The Lua filter appends blank `EvidenceSpace` paragraphs whether or not helper text exists. Both styles are 14pt; the space style uses 20pt line height. Requested height controls approximate blank space beneath the hint. Added student content may increase pagination. Do not delete helper text to work around sizing problems.
- The v2 reference replaces the stale title placeholder with a DOCPROPERTY Subject field and enables field updates. Its cached text is the Word Processing title for first-open display. A different unit should update that cached title when deriving its reference.
- Existing fonts, borders, colours and header/footer design are inherited from the original template. Neither the original template nor the generated booklet is manually edited.

## Content and image workflow

Change the v2 task plan in `Word processing software/spec-v2.md` first, then the v2 Markdown/HTML. Re-run the build after booklet changes.

The student HTML guide stays inside the Word Processing student submodule. Its nine `screenshot-*` figures are teacher image placeholders. Each includes a capture brief and HTML comment: replace the figure contents with an `img` using a relative path and meaningful `alt`, preserving the caption. Store screenshots alongside the guide or in a student-resource images folder. These teaching screenshots are separate from the student evidence boxes in Booklet Tasks 2–6.

The existing three template examples and planning form are unchanged. Students work through the planning form in stages; Heading 3 and elaborate running headers are extensions. Students paste focused project screenshots into the booklet and may hand in a printed project guide as additional evidence.

## Visual guidance

Keep the original HTML guide’s inviting use of colour, icons, visual menu paths, keyboard styling and varied panels. The v2 guide pairs icons with text, uses coloured “Why this helps”, “Try it” and “Check” panels, and retains short practical steps. Teacher screenshot placeholders remain distinct from student evidence instructions.

## Cover guidance conflict resolved

The PNGs are the authoritative cover layout. The original Word Processing DOCX is retained as a legacy resource and must not reintroduce its separate/repeated titles. In `AGENTS.md`, only cover-specific instructions are changed. The only deviation from the PNG layout is the two-row date/teacher table: headings on top, blank data below.

The unit artwork area is reserved inside the large panel. Replace its placeholder with a teacher-supplied unit image in the Markdown and rebuild; do not edit the generated DOCX to apply layout fixes.
