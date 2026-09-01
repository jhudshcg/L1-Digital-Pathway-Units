# instructions for agents involved in L1 digital course unit resources and planning

Rules, context and guidlines applying to all course units.

## Target audience

Level 1 students, UK, 16+, pre-GCSE, with a range of learning needs.

## Delivery style

Short intros, demos, explanations and understanding checks, followed by practical activities and projects, with clear instructions and guidance. Resources should be self-contained to allow students to work independently, with minimal teacher support. Most of the lesson time should be spent on practical activities and projects, with the teacher circulating to support where needed.

## Resource materials

All learning material and activities and projects must be well scaffolded and engaging, with extremely clear and concise instructions for work sequence and requirements.

Use simple, clear, concise language in all resources. A little humour in places in fine.

Visual hiearchy, visual queues, images, icons and colour should be used for clarity.

Resources should be designed to be accessible for students with a range of learning needs, including dyslexia, visual impairments, and other learning difficulties.

Resources and project guidance should be complete enough to allow students to work independently, with minimal teacher support. This will allow for a more flexible learning environment, where students can work at their own pace and focus on areas where they need more support, while the teacher can provide targeted support to those who need it, along with selected whole class teaching and support.

### Project booklets
Each unit project will have a student project booklet in its resource set, in docx format. The project booklet will include:
- Title page with unit title code, space for cover image, space for student name, issue date, hand in date and teacher name.
- Project title, unit code and credit and unit aim.
- Assessment criteria.
- Project brief and requirements.
- Sequence of tasks and activities linked to specific assessment criteria, which take students through the project in a clear and structured way. 
- Each task section will include clearly marked areas (spaces, boxes, lined sections, tables, etc.) for students to record their work and evidence their learning outcomes.

The project booklets will use a consistent style, but have activities and tasks tailored to the specific unit and project. 

Project booklet header will contain the unit title and code to the left and the unit credit to the right. The footer will contain page # of #.

Project booklets will first be created in md format, then converted to docx format using pandoc. The md files will be stored in the project src folder for each unit, and the docx files will be stored in the root folder for each unit.

#### Booklet Layout & Pandoc Shorthands
All `booklet.md` files must use the shared Lua layout filter classes defined in `layouts/layouts.lua` / `layouts/README.md`:

- **Unit Header Banner (Page 1 top):** Always use `::: {.layout-unit-header unit-title="..." unit-code="..." credits="..." project="..."}` at the top of the cover page.
- **Student metadata & cover details:** Always use `::: layout-metadata-table` containing a 2-column markdown table for Learner Name, Learner ID, Assessor Name, Issue Date, Submission Date, and IV Date.
- **Student written answers & screenshot evidence:** Always wrap responses in `::: {.layout-textbox height="3.5cm" title="..."}` (adjust `height` as needed, e.g. `6.5cm`–`7.5cm` for screenshots or code). **Never wrap `:::` divs inside markdown pipe tables (`|`).**
- **Concept mapping / moodboards / feature brainstorming:** Use a variety of suitable task evidencing layouts to keep the booklet visually interesting and engaging for students. For example, for 5 related concepts, perhaps with a central concept, use `::: {.layout-5-textbox-cross}` with nested `::: tl`, `::: tr`, `::: center`, `::: bl`, and `::: br` divs.
- **Page breaks:** Use `::: layout-page-break` between major sections/tasks.
- **Student declaration:** Always end the booklet with `::: layout-declaration` containing the authenticity statement, checkbox, name, ID, date, and signature fields.

Tabular data and data entry areas should be formatted as tables with visible cell borders.

Text entry areas should be formatted as boxes with visible borders, with a title above the box to indicate what the student should enter.

Default text entry box height should be sufficient for 5 lines of text, but should be adjustable for longer responses or for screenshot evidence.

Default text size should be 14pt.

Full use of Title, Subtitle, Heading 1, Heading 2, Heading 3, and normal text styles (normal, italic, bold) should be used throughout the booklet to create a clear visual hierarchy.

General look and feel of booklets should be consistent across all units, with a clean, simple and professional design, using a consistent font, colour scheme and layout.

#### Front page content

[Front page name] student name

[Title] unit title and code

[Subtitle] Level 1 Ascentis Progression

Unit cover image

[Table] 2 rows. header: issue date, hand in date, iv date, teacher name

#### Second page content

Learning outcomes and assessment criteria heading with table, with 2 columns. Left column: learning outcome. Right column: assessment criteria.

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

For visual example layouts to base new booklet designs on, see layouts/example_front_p1_1.png and layouts/example_front_p1_2.png. Note in particular the use of tables, font sizes and spacing.

#### XML vs Pandoc AST & Word Style Mapping

- **Avoid using custom Open XML tags in the booklet md files.** Use only clean Pandoc AST and the shared Lua layout filter classes defined in `layouts/layouts.lua` / `layouts/README.md`.
- **Word Style IDs vs Display Names:** When referencing or assigning Word styles via Pandoc AST attributes (`custom-style`), always use the underlying **Style ID** without spaces (e.g. `custom-style="TableGrid"`, not `custom-style="Table Grid"`). Microsoft Word resolves styles strictly by their exact XML Style ID; mismatched display names cause Word to silently fall back to unstyled defaults (`TableNormal` without borders).
- **Template-Driven Styling:** All visual styling (borders, padding, background shading, table gridlines, and fonts) must be managed in `booklet_template.docx` rather than hardcoded XML in filters. Pandoc AST structures inherit directly from the reference doc.

## Course breakdown

4 units, delivered over 3 90 minute lessons per week, over the academic year (Sept - June, with 2 weeks in July for overrun if needed).

36 learning weeks, so 9 weeks per unit. ~ 40 hours per unit.

Units can take less time. Most have 20-27 guided learning hours (GLH) from the qualification spec. But some are also organized with additional learning to take more (e.g. programming in Design Software). Any surplus time can be used for additional learning, or to allow students to work at their own pace and focus on areas where they need more support, or to start their own additional projects using related skills and knowledge.

Plan for the assessed parts of each unit, including the individualproject booklets to be fully completed within the first 6-7 weeks of each unit. This builds in some overrun time and allows for additional learning for students who can go further.

## Units

Unit	                    Code	     Notes
Imaging Software	        R/505/3062	 Photoshop, poster/ad designs

Multi-media Software Skills	R/505/1688	 Make a webpage with images and audio

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

