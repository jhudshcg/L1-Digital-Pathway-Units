# Shared Word Layout Library for L1 Digital Course Units

This folder contains the central Pandoc Lua filter (`layouts/layouts.lua`) used across all 4 units (`Design Software`, `Imaging Software`, `Multi-media Software Skills`, `Word processing Software`).

---

## Available Layouts & Markdown Shorthands

### 1. `layout-unit-header` (Top of Front Cover)
Renders a 2-column top banner with Unit Title and Unit Code on the left, and Credit Value and Project Name on the right (matching `layouts/example_front_p1_1.png`).

```markdown
::: {.layout-unit-header unit-title="Design Software" unit-code="R/505/6389" credits="3 Credits" project="Campus Canteen Ordering System"}
:::
```

---

### 2. `layout-metadata-table` (Front Page Metadata)
Renders a structured 2-column table with 35% label width and 65% input/write-in cell width.

```markdown
::: layout-metadata-table
| Field | Details |
| :--- | :--- |
| **Learner Name:** | |
| **Learner ID:** | |
| **Assessor Name:** | |
| **Issue Date:** | |
| **Submission Date:** | |
| **Internal Verification (IV) Date:** | |
:::
```

---

### 3. `layout-textbox` (Student Answers & Screenshot Evidence)
Renders a styled response box with an optional header prompt.

```markdown
::: {.layout-textbox height="4cm" title="Target Audience Response:"}
*(Type your explanation here...)*
:::

::: {.layout-textbox height="7.5cm" title="Cover Screenshot Evidence:"}
*(Paste your finished screenshot here)*
:::
```

* **Attributes:**
  - `title="..."`: Creates a bold header row above the box.
  - `height="3.5cm" | "5cm" | "7.5cm"`: Allocates vertical writing/screenshot space.

---

### 4. `layout-5-textbox-cross` (5-Box Concept Map)
Renders a 3x3 concept map with 4 corner boxes and 1 central theme box:

```markdown
::: {.layout-5-textbox-cross}

::: tl
**Visual Style & Colours**
- Palette ideas:
:::

::: tr
**Typography & Fonts**
- Heading font:
:::

::: center
**CORE DESIGN THEME**
**Campus Canteen App**
Target Audience:
:::

::: bl
**Interactive Features**
- Allergen filters:
:::

::: br
**Assets & Photography**
- Image sources:
:::

:::
```

---

### 5. `layout-declaration` (Authenticity Declaration)
Renders a student authenticity declaration box with signature and date fields at the end of the booklet.

```markdown
::: layout-declaration
I confirm that the work presented in this project booklet and codebase is my own work and has been carried out according to the assignment instructions.

[ ] **I confirm this is my own authentic work.**

**Student Name:** ________________________________________  
**Student ID:** ____________________ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **Date:** ______________  
**Student Signature:** ____________________________________
:::
```

---

### 6. `layout-page-break`
Inserts a native Word page break.

```markdown
::: layout-page-break
:::
```

#### Markdown Shorthand:
```markdown
::: {.layout-5-textbox-cross height="14cm"}

::: tl
**Top-Left: Visual Theme**
- Retro americana diner colors
- Bold neon accents
:::

::: tr
**Top-Right: Typography**
- Chunky header font
- Clean sans-serif body
:::

::: center
**CENTRE THEME**
**Burger Joint App**
Core target audience: 16-25 students
:::

::: bl
**Bottom-Left: Key Features**
- Interactive menu selector
- Price basket calculator
:::

::: br
**Bottom-Right: Audio & Media**
- Click sound effect
- Hero background image
:::

:::
```

#### Optional Attributes:
* `height`: Total height of the cross area (e.g., `height="12cm"`, `height="15cm"`).
* `col1-width`, `col2-width`, `col3-width`: Specific column widths.
* `corner-bg`: Background hex fill for the 4 corner boxes (default: `F4F6F9`).
* `center-bg`: Background hex fill for the centre box (default: `E8F0FE`).

---

### 6. `layout-page-break`
Inserts a clean Word native page break.

#### Markdown Shorthand:
```markdown
::: layout-page-break
:::
```

---

## Dynamic Header & Footer in Word (`booklet_template.docx`)

To display **Unit Title & Code** (left) and **Credits** (right) in Word's running header:
1. Open `booklet_template.docx` in Microsoft Word.
2. Double-click the Header area on Page 2 (with "Different First Page" enabled so the cover page stays clean).
3. Insert a 2-column table or right-aligned tab:
   - **Left:** Insert Document Property: `Insert` $\rightarrow$ `Quick Parts` $\rightarrow$ `Document Property` $\rightarrow$ `Title` (or `Subject`), or type the unit code template.
   - **Right:** Type `Credit Value: 3` (or use `Category` / Document Property).
4. In the Footer:
   - **Center/Right:** Insert `Quick Parts` $\rightarrow$ `Field...` $\rightarrow$ `Page` of `NumPages` (`Page X of Y`).
5. Save `booklet_template.docx`. Pandoc will preserve this running header and footer across all rendered booklets.
