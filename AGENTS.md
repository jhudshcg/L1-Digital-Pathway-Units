# instructions for agents involved in L1 digital course unit resources and planning

Rules, context and guidlines applying to all course units.

## Target audience

Level 1 students, UK, 16+, pre-GCSE, with a range of learning needs.

## Delivery style

Short intros, demos, explanations and understanding checks, followed by practical activities and projects, with clear instructions and guidance. Resources should be self-contained to allow students to work independently, with minimal teacher support. Most of the lesson time should be spent on practical activities and projects, with the teacher circulating to support where needed.

## Resource materials

All learning material and activities and projects must be well scaffolded and engaging, with extremely clear and concise instructions for work sequence and requirements. 

Activities, challenges or tasks should require some thinking and problem solving. They should not directly give the answer away, while remaining suitable for the target audience.

Early guide material activities and booklet tasks should be easier/simpler, with some progression as learning and progress through each unit is made.

Use simple, clear, concise language in all resources. A little humour in places in fine.

Visual hiearchy, visual queues, images, icons and colour should be used for clarity.

Resources should be designed to be accessible for students with a range of learning needs, including dyslexia, visual impairments, and other learning difficulties.

Resources and project guidance should be complete enough to allow students to work independently, with minimal teacher support. This will allow for a more flexible learning environment, where students can work at their own pace and focus on areas where they need more support, while the teacher can provide targeted support to those who need it, along with selected whole class teaching and support.

Language style in student facing resources should be clear, concise, simple and friendly. Encouragement and a sprinkling of humour is also good.

Resources should be visually engaging, with use of colour, visual hierarchy, icons, clip-art and images to support clarity and understanding.

### Project booklets

Each unit project will have a student project booklet in its resource set, in docx format. The project booklet will include:
- Title page with unit title code, space for cover image, space for student name, issue date, hand in date and teacher name.
- Project title, unit code and credit and unit aim.
- Assessment criteria.
- Project brief and requirements.
- Sequence of tasks and activities linked to specific assessment criteria, which take students through the project in a clear and structured way. 
- Each task section will include clearly marked areas (spaces, boxes, lined sections, tables, etc.) for students to record their work and evidence their learning outcomes.

The project booklets will use a consistent style, but have activities and tasks tailored to the specific unit and project. 

Project booklet header will contain the unit title and code to the left and the unit credit to the right. The footer will contain page # of #. Header and footer content, fields and formatting are supplied by the canonical `booklet_template.docx` passed to Pandoc; do not generate them in the Markdown or Lua filter.

Project booklets will first be created in md format, named `booklet-[unit-name].md` (e.g. `booklet-design-software.md`, `booklet-word-processing-software.md`, `booklet-imaging-software.md`, `booklet-multimedia-software.md`), then converted to `booklet-[unit-name].docx` format using pandoc. The md files will be stored in the project `src` folder for each unit (`<Unit>/src/booklet-<unit-name>.md`), and the current VS Code workflow will generate the docx files beside their Markdown sources in `src` (`<Unit>/src/booklet-<unit-name>.docx`). Existing DOCX files in unit root folders are not updated by this workflow.

#### Booklet Layout & Pandoc Shorthands

All `booklet-[unit-name].md` files must use the shared Lua layout filter classes defined in `layouts/layouts.lua` / `layouts/README.md`:

- **Cover:** Follow the PNG-based front-page layout below. Use the `layout-cover` panel, not a `layout-unit-header` banner.
- **Cover details:** Put the student-name line inside the main cover panel. Use `layout-cover-dates` below it: one header row and one blank data row, with Issue Date, Hand in Date, IV Date and Teacher Name columns. Do not use the generic two-column `layout-metadata-table` on the cover.
- **Student written answers & screenshot evidence:** Always wrap responses in `::: {.layout-textbox height="3.5cm" title="..."}` (adjust `height` as needed, e.g. `6.5cm`–`7.5cm` for screenshots or code). **Never wrap `:::` divs inside markdown pipe tables (`|`).**
- **Concept mapping / moodboards / feature brainstorming:** Use a variety of suitable task evidencing layouts to keep the booklet visually interesting and engaging for students. For example, for 5 related concepts, perhaps with a central concept, use `::: {.layout-5-textbox-cross}` with nested `::: tl`, `::: tr`, `::: center`, `::: bl`, and `::: br` divs.
- **Page breaks:** Use `::: layout-page-break` between major sections/tasks.
- **Student declaration:** Always end the booklet with `::: layout-declaration` containing the authenticity statement, checkbox, name, ID, date, and signature fields.

Tabular data and data entry areas should be formatted as tables with visible cell borders.

Text entry areas should be formatted as boxes with visible borders, with a title above the box to indicate what the student should enter.

Default text entry box height should be sufficient for 5 lines of text (including in 5 textbox cross layouts), but should be adjustable for longer responses or for screenshot evidence. If using a grid to arrange text boxes (e.g. the 5 textbox cross layout), only the text boxes that students type in should have visible borders, not the grid cells just used for layout.

Table column widths: if column data is short, e.g. a single number or a few characters, then make the column width shorter, to allow more space for any longer data columns, e.g. file paths, descriptions or screenshots, which should be made wider.

Default text size should be 14pt.

Full use of Title, Subtitle, Heading 1, Heading 2, Heading 3, and normal text styles (normal, italic, bold) should be used throughout the booklet to create a clear visual hierarchy. 

Never use normal text for what is functioning as a heading or sub heading - user the appropriate heading level style.

General look and feel of booklets should be consistent across all units, with a clean, simple and professional design, using a consistent font, colour scheme and layout.

#### Front page content — authoritative layout

Follow `layouts/example_front_p1_1.png` and `layouts/example_front_p1_2.png` for the cover layout. The only intentional layout difference is the date/teacher table described below.

- Keep the Ascentis logo above one large bordered panel.
- Inside that panel, place the student-name line, Level 1 / Ascentis Progression, unit code, unit title and a prominent unit cover image, in that order. Centre the qualification, code, title and image as shown in the PNGs. Use each title/qualification label once.
- Below the panel, use a four-column table with exactly two rows: a header row containing Issue Date, Hand in Date, IV Date and Teacher Name, followed by one blank data row.
- The teacher selects the booklet cover artwork. Reference the image in the Markdown `cover-artwork` block so Pandoc embeds it automatically. Size the image and use template spacing so the panel and date/teacher table all fit on page 1.
- Preserve the reference page border and branding. Do not add a unit banner, a six-field metadata form, repeated title/subtitle blocks, or a version label to the cover.

The PNG examples and the front-page instructions above define the booklet cover layout. The student's own project cover is separate from this assessment booklet cover.

#### Second page content

Learning outcomes and assessment criteria heading with table, with 2 columns. Left column: learning outcome. Right column: assessment criteria. Within the right column, each individual criteria should be on its own line, not bunched into a single paragraph.

Wrap the grid table in `layout-assessment-criteria` so the Lua filter applies the template's `AssessmentCriteria` paragraph style (12pt, slightly smaller than the normal 14pt text). Keep the heading and introductory text outside this wrapper. Preserve all criteria wording and check that the complete section fits on page 2 when rendered.

Text before table:
"In order to pass this unit, the evidence that the learner presents for assessment needs to demonstrate that they can meet all the learning outcomes for the unit. The assessment criteria determine the standard required to achieve the unit."

#### Third page content

Assignment/project brief and requirements.

Short list of useful links and references for the project, including links to any exemplar projects and starter template files and well as any external resources.

#### Fourth page onwards content

Sequence of tasks and activities linked to specific assessment criteria, which take students through the project in a clear and structured way. Each task section will include clearly marked areas (spaces, boxes, lined sections, tables, etc.) for students to record their work and evidence their learning outcomes.

#### Last page content

Student declaration of authenticity, with checkbox, name, ID, date and signature fields.

#### Example layouts

`layouts/example_front_p1_1.png` and `layouts/example_front_p1_2.png` define the required cover grouping, hierarchy, image placement and branding. Change only their paired label/value date-table arrangement to the header-row/data-row arrangement specified above.

#### XML vs Pandoc AST & Word Style Mapping

- **Avoid using custom Open XML tags in the booklet md files.** Use only clean Pandoc AST and the shared Lua layout filter classes defined in `layouts/layouts.lua` / `layouts/README.md`. The exception to this is where a Word Form is explicitly required, which will need custom Open XML.
- **Word Style IDs vs Display Names:** When referencing or assigning Word styles via Pandoc AST attributes (`custom-style`), always use the underlying **Style ID** without spaces (e.g. `custom-style="TableGrid"`, not `custom-style="Table Grid"`). Microsoft Word resolves styles strictly by their exact XML Style ID; mismatched display names cause Word to silently fall back to unstyled defaults (`TableNormal` without borders).
- **Template-Driven Styling:** All visual styling (borders, padding, background shading, table gridlines, and fonts) must be managed in `booklet_template.docx` rather than hardcoded XML in filters. Pandoc AST structures inherit directly from the reference doc.
- **YAML Frontmatter & Word Running Headers:** Set `title: "<Unit Name> (<Unit Code>)"` in the YAML frontmatter. Pandoc writes this metadata to Word's `docProps/core.xml` property, which dynamically populates the Word running header field on Page 2+. For `cover-layout: png`, the shared `layouts/layouts.lua` filter moves the title into subject metadata and suppresses the automatic title/subtitle block so that the cover is rendered only inside its panel. The canonical `booklet_template.docx` header reads that subject field. Do not add a separate automatic title above the panel.
- **Table Formatting for Assessment Criteria:** Always use Pandoc Markdown grid table syntax (`+---+---+`) rather than pipe tables (`|`) when cells contain multiple distinct paragraphs (such as each assessment criterion on its own line). Pipe tables treat `<br>` as line breaks within a single paragraph, whereas grid tables produce true separate Word paragraphs with correct spacing.
- **Strict Heading Hierarchy & Markdown Heading Mapping (via Lua Header Shift):**
  - Markdown files must remain 100% valid Markdown (single `#` for document title on cover page; all body sections start at `##`).
  - The Lua filter (`layouts/layouts.lua`) automatically shifts body headers down by 1 level so they map cleanly to Word styles:
    - Cover title mapping must follow the PNG-based panel above. The cover uses template-defined cover styles and suppresses the automatic YAML title block; do not repeat the title.
    - `## Major Section Title` -> Word `Heading 1` (e.g. `## Learning Outcomes...`, `## Assignment Brief...`, `## Section 1: Planning`, `## Student Declaration...`)
    - `### Sub-Section / Task Title` -> Word `Heading 2` (e.g. `### Project Title`, `### Unit Aim`, `### Project Brief & Scenario`, `### Useful Links & Starter Resources`, `### Task 1: ...`)
    - `#### Question / Item Title` -> Word `Heading 3` (e.g. `#### 1. Topic Selection & Requirements`)
  - **NEVER simulate headings using inline code/backticks** (e.g. `` `Project Title` ``). Backticks map to Word's `VerbatimChar` / monospace code character style and do NOT create heading paragraphs.
  - **NEVER simulate headings using bold paragraphs** (e.g. `**Project Title:**` on a standalone line).
  - **NEVER leave headings unstyled as plain normal text** (e.g. `Project Brief & Scenario` without `###`).
  - Explanatory body text below headings must always be regular unbolded paragraph text (`BodyText` / `Normal`).

#### Word Form Templates & OpenXML Content Controls

When creating interactive Word Forms (e.g. `topic-planning-form.md`):
- **Native ECMA-376 SDTs:** Use standard `<w:sdt>` Content Controls embedded with Pandoc inline raw openxml (`\`<w:sdt>...\</w:sdt>\`{=openxml}`).
- **Drop-Down Lists (Crucial Schema Rule):** Dropdown items MUST use tag `<w:listItem w:displayText="..." w:value="..."/>`. Never use `<w:listEntry>` or `w:val` for list items, as Word's strict schema validator will reject the document as corrupt.
- **Plain Text & Date Pickers:** Use `<w:text/>` for text fields and `<w:date><w:dateFormat w:val="dd/MM/yyyy"/><w:lid w:val="en-GB"/></w:date>` for calendar pickers.
- **No Undeclared Namespaces:** Avoid Office 2010+ extension controls (e.g. `<w14:checkbox>`) in Pandoc Markdown, as Pandoc does not emit the `xmlns:w14` root namespace declaration.
- **No Raw Linefeeds in Runs:** Never use literal linefeeds (`&#10;` or raw `\n`) inside `<w:t>` elements; use separate runs or paragraphs instead.
- **Reference Helper:** See `layouts/word-forms.lua` for reusable generator functions and Pandoc inline span filter shorthands (`.form-text`, `.form-date`, `.form-dropdown`).

Set the correct document property YAML in the booklet md files to ensure the correct title, subtitle, and other metadata is applied to the generated Word document.

#### Booklet content planning

Use the `Booklet tasks/activities with assessment criteria mapping` section in each unit spec.md file to plan the content and sequence of tasks and activities for the project booklet, along with the evidence that students will provide, and the assessment criteria mapping. Then use that agreed plan to help create the booklet.md file for the unit, which will be converted to docx format using pandoc. This way the content and sequence can be stabilized independently of the booklet layout styling, which may be in flux.

Each sequenced item in this section of the unit spec file should be concise, but with enough detail to clearly indicate the task or activity, the evidence that students will provide, and the assessment criteria mapping.

If booklet tasks/activities change, they should be changed in the spec.md section first, then the booklet.md file should be updated to match the agreed plan.

When designing and planning the booklet tasks, consider the following:
- Each assessment criteria should be evidenced by at least one task or activity in the booklet.
- The link from the task to the assessment criteria should be logical and clear.
- Large differences in assessment criteria coverage should be avoided, e.g. one assessment criteria should not have 5 tasks linked to it and another only 1 task.
- After the initial task list draft, review the list to see if other criteria can be reasonably linked to the tasks.

## Course breakdown

4 units, delivered over 3 90 minute lessons per week, over the academic year (Sept - June, with 2 weeks in July for overrun if needed).

36 learning weeks, so 9 weeks per unit. ~ 40 hours per unit.

Units can take less time. Most have 20-27 guided learning hours (GLH) from the qualification spec. But some are also organized with additional learning to take more (e.g. programming in Design Software). Any surplus time can be used for additional learning, or to allow students to work at their own pace and focus on areas where they need more support, or to start their own additional projects using related skills and knowledge.

Plan for the assessed parts of each unit, including the individualproject booklets to be fully completed within the first 6-7 weeks of each unit. This builds in some overrun time and allows for additional learning for students who can go further.

## File organization and submodules

Each unit will have its own folder, with a subfolder for the student repository, which will be a git submodule. The student repository will contain the starter template files, exemplar projects, and any additional guides or resources for the unit - essentially anything that isn't the src folder or the spec.md file, should be moved into the student repo submodule folder.

Each submodule should be named l1-[unit-name]-student, e.g. l1-design-software-student, and should be tagged with the GitHub topic level-1.

## Development iterations

Avoid applying time consuming temp file clean up or zip/unzip operations each round. Use numbered temp files for each iteration to avoid having to delete and re-create and apply clean up only periodically, e.g. every 10 rounds.

Minimize running commands that require permissions.

If you have to read file contents, read the complete file, then scan/search from that single read, rather than make multiple separate requests.

Also, don't issue git commit commands. The human in the loop should remain in charge of what gets commited and when.

## Units

Unit	                    Code	     Notes
Imaging Software	        R/505/3062	 Photoshop, poster/ad designs

Multi-media Software Skills	R/505/1688	 Make a webpage with images and video

Design Software	            R/505/6389	 Could be design of a simple computer program, using VSCode

Word processing Software	D/505/6398	 Create small research report or guide (choose from presented options), evidence criteria through the report.

**Unit projects**


### Imaging Software

...

### Multi-media Software Skills

...

### Design Software

see `Design%20Software/spec.md` for full project brief and requirements.
 

### Word processing Software

...

