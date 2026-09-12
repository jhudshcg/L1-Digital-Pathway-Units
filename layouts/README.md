# Shared Word booklet layouts

Course-wide audience, content and layout instructions are in [AGENTS.md](../AGENTS.md). This reference documents the shared [layouts.lua](layouts.lua) filter and [booklet_template.docx](../booklet_template.docx).

## Sources and responsibilities

- Each unit's `spec.md` defines the task sequence and assessment mapping. Update that plan before changing booklet tasks.
- `<Unit>/src/booklet-<unit-name>.md` contains booklet content, layout classes and image references.
- `layouts.lua` transforms those classes into tables, styled paragraphs and page breaks. It maps Markdown `##` to Word Heading 1, `###` to Heading 2 and `####` to Heading 3.
- `booklet_template.docx` owns fonts, colours, borders, spacing, branding, headers and footers. Edit the reference template directly when changing its styles; it does not need to be rebuilt from an older template.
- `<Unit>/src/booklet-<unit-name>.docx` is the generated output for the current VS Code workflow, beside its Markdown source. Make reproducible corrections in the Markdown, filter or reference template, then regenerate. Do not repair the output as a substitute for fixing its sources.

## Build from VS Code

Open `L1 Digital` as the workspace so that the [root settings](../../.vscode/settings.json) apply. Pandoc must be installed and available on PATH.

1. Open the Markdown file you want to convert.
2. Run **Pandoc: Select Profile** and choose **Booklet** for a booklet in a unit's `src` folder, or **Planning form** for the Word Processing form in the student submodule's `templates` folder. Booklet is the default profile; switch back after rendering a form.
3. Run **Pandoc: Render** and choose **docx**.

The profiles select the canonical reference template and Lua filter using paths relative to the source file. The installed extension runs Pandoc from that file's folder, so the booklet's `booklet_cover.png` reference also resolves there. No Python build script is required.

Output is saved beside the Markdown with the same base filename and a `.docx` extension. A booklet therefore renders into `src`; the planning form renders into `templates`. Existing booklet copies in unit root folders are not updated by this workflow.

For an explicit command-line equivalent, run the following **from `Word processing software/src`**:

```sh
pandoc booklet-word-processing-software.md \
  --reference-doc=../../booklet_template.docx \
  --lua-filter=../../layouts/layouts.lua \
  --resource-path=. \
  -o booklet-word-processing-software.docx
```

After rebuilding, check the rendered cover and page 2. Image dimensions and paragraph styles help control pagination, but source checks alone do not prove that a page fits.

## Cover

Follow [example_front_p1_1.png](example_front_p1_1.png) and [example_front_p1_2.png](example_front_p1_2.png), subject to the authoritative cover instructions in AGENTS.md. The only intentional layout difference is the date table: four headings followed by one blank data row.

The reference template supplies the Ascentis logo above one bordered panel. The Markdown supplies the panel contents in this order:

```markdown
---
title: "Word Processing Software (D/505/6398)"
subtitle: "Level 1 Ascentis Progression"
cover-layout: png
---

:::: layout-cover
::: cover-name
Student  
Name: ........................................
:::

::: cover-qualification
Level 1  
Ascentis Progression
:::

::: cover-code
Unit D/505/6398
:::

::: cover-title
# Word Processing Software
:::

::: cover-artwork
![Word Processing unit cover artwork](booklet_cover.png){width="9cm"}
:::
::::

::: layout-cover-dates
| Issue Date | Hand in Date | IV Date | Teacher Name |
| :---: | :---: | :---: | :---: |
| | | | |
:::

::: layout-page-break
:::
```

The teacher selects the cover artwork. Word Processing uses `src/booklet_cover.png`; Pandoc embeds it from the Markdown image reference. Keep the image and all cover content on the first page. Adjust the source image dimensions or template spacing if rendering reveals overflow.

`CoverFrame`, `CoverDates`, `CoverName`, `CoverQualification`, `CoverCode`, `CoverUnitTitle` and `CoverArtwork` are template styles selected by the filter. With `cover-layout: png`, the filter moves YAML `title` into document `subject` metadata and removes `title` and `subtitle` to prevent an extra automatic title block. The template's running header reads `DOCPROPERTY Subject`. The filter does not create header or footer content. When reusing the template for another unit, check its cached header text and credit value as well as the updated document fields.

## Assessment criteria on page 2

Use a Markdown grid table with one paragraph per criterion, wrapped in `layout-assessment-criteria`:

```markdown
::: layout-assessment-criteria
+-----------------------+----------------------------------+
| Learning Outcome      | Assessment Criteria              |
+=======================+==================================+
| Learning outcome text | First criterion paragraph.       |
|                       |                                  |
|                       | Second criterion paragraph.      |
+-----------------------+----------------------------------+
:::
```

The filter applies the template's `AssessmentCriteria` paragraph style throughout this table, retaining table borders. That style is 12pt, single spaced, with 2pt after paragraphs; normal text remains 14pt. Keep the page heading and required introductory text outside this wrapper. Preserve the full criteria wording and check that the complete section fits on page 2 after rendering.

## Answers and screenshot evidence

```markdown
::: {.layout-textbox height="4cm" title="Your explanation"}
Use this space to explain your choice.
:::

::: {.layout-textbox height="7.5cm" title="Screenshot evidence"}
Paste a focused screenshot showing the feature you used.
:::
```

`title` creates a bold prompt row. Helper text stays inside the response cell using `EvidenceHint`; blank `EvidenceSpace` paragraphs are appended independently. Both styles use 14pt text, and the space style uses 20pt lines. `height` specifies approximate blank space in centimetres beneath the hint, not a fixed total box height. Omitting it reserves five blank lines. Student content can increase the height and pagination. Keep useful helper text when adjusting layout.

Do not put fenced layout Divs inside Markdown pipe tables. Supported response-box aliases are `layout-response-box`, `layout-evidence-box`, `layout-box` and `AnswerBox`.

For Word Processing, students use focused screenshots of their project document in the booklet tasks. The editable project document can also support assessment, and a printed copy is additional evidence. Teacher screenshots illustrating Word tools belong in the student guide and are separate from these evidence boxes.

## Other shared layouts

### Authenticity declaration

`layout-declaration` wraps the supplied content in a bordered table; it does not generate the fields automatically. Place it at the end of the booklet.

```markdown
::: layout-declaration
I confirm that this is my own work.

[ ] I confirm this is my own authentic work.

Student Name: ________________________________________

Student ID: ____________________    Date: ______________

Student Signature: ____________________________________
:::
```

### Page break

```markdown
::: layout-page-break
:::
```

This inserts a native Word page break. `page-break` is also supported.

### Five-box concept map

```markdown
:::: layout-5-textbox-cross
::: tl
Top-left ideas
:::
::: tr
Top-right ideas
:::
::: center
Central theme
:::
::: bl
Bottom-left ideas
:::
::: br
Bottom-right ideas
:::
::::
```

The current implementation uses a three-by-three table with column widths of 38%, 24% and 38%, styled as `TableGrid`. It does not implement height, custom column-width or background-colour attributes, or add blank writing space automatically. It also does not hide the unused grid cells' borders, so it does not yet meet AGENTS.md's requirement for borders only around the five response areas. Review that implementation before using it for a new booklet.

### Generic unit banner and metadata form

These remain available for existing resources. They are not the required booklet cover and do not replace `layout-cover` or `layout-cover-dates`.

```markdown
::: {.layout-unit-header unit-title="Design Software" unit-code="R/505/6389" credits="3 Credits" project="Campus Canteen Ordering System"}
:::

::: layout-metadata-table
| Field | Details |
| :--- | :--- |
| Resource name | |
| Notes | |
:::
```

The banner uses two columns, 55% and 45%. The metadata form uses 35% for labels and 65% for details. Both use the template's `TableGrid` style. Ordinary Markdown tables receive `TableGrid` unless another custom style is already assigned.
