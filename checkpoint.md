# Project Checkpoint: L1 Digital Skills Course Units

**Last Updated:** 2026-08-27  
**Active Focus:** Design Software Unit (R/505/6389) & Course Framework Setup

---

## 1. Current Status & Progress Summary

### A. Global Guidelines & Architecture ([AGENTS.md](AGENTS.md))
- **Target Audience:** UK Level 1 learners (16+, pre-GCSE, high scaffolding, independent pacing, visual hierarchy).
- **Delivery Model:** 4 units over 36 weeks (9 weeks / ~40 hours per unit; 3 × 90 min lessons/week).
- **Assessment Horizon:** Individual student project booklets completed within weeks 1–6/7, leaving weeks 8–9 for buffer/extension.
- **Resource Pattern:**
  - Project booklet source in Markdown (`src/booklet.md`) converted to Word (`booklet.docx`) via Pandoc.
  - Max 3–4 concise HTML guide docs (2–3 pages max) with short intros, demos, understanding checks, and practical steps.
  - Cleanly scaffolded starter template codebase + 2 distinct completed design exemplars (without spoiling coding challenges).

---

### B. Unit 1: Design Software (`Design Software/`) — Draft Resources Created & Refined
- **Theme:** Canteen Ordering System (HTML/CSS/JS in VS Code).
- **Images:** All images stored locally in `images/` within `template/` and each exemplar (no external hotlinking).
- **Class Naming Architecture:**
  - Layouts: `layout-grid`, `layout-flex`, `layout-sidebar-left`, `layout-single-column`
  - Colour Schemes: `colour-light`, `colour-dark`, `colour-contrast`
  - Design Themes: `theme-modern`, `theme-retro`, `theme-americana`, `theme-punk`, `theme-emo`
  - Spacing: `spacing-compact`, `spacing-standard`, `spacing-spacious`
- **Starter Template (`template/`):**
  - `index.html`: Base semantic structure with class customization options.
  - `style.css`: Modular stylesheet with layout flexibility, typography, and contrast themes.
  - `util.js`: Background rendering, event listeners, state management.
  - `app.js`: 10-item data skeleton with local `images/` paths + 5 scaffolded coding challenges.
- **Exemplar Projects (`examples/`):**
  - `demo-americana-diner/`: `layout-grid colour-light theme-americana spacing-standard` (Bungee typography, red diner borders, tray on right).
  - `demo-punk-eats/`: `layout-sidebar-left colour-dark theme-punk spacing-compact` (Tray on the LEFT, stark B&W + neon pink, Creepster & Special Elite fonts, tilted cards, ban-the-bomb ☮ & anarchy Ⓐ decals).
- **HTML Guides (`guides/`):**
  - `guide-1-research-and-design.html`: Minimum menu requirements, spreadsheet research table, image copyright & local `images/` downloads, visual diagram mockups of mood boards & wireframes.
  - `guide-2-customising-styles.html`: 3 building blocks of the web (HTML/CSS/JS), elements, `<body>` tag, CSS classes, and hands-on styling micro-activity with full cheat sheet.
  - `guide-3-coding-challenges.html`: Friendly programming intro (variables, loops, if-conditions, functions), snippet bank adaptation, option-driven multiple-choice problem solving for 5 coding challenges without giving answers away.
  - `git-and-testing-guide.html` (*Git Version Control & Testing Guide*): Unnumbered guide for use prior to coding with GitHub repo cloning, local per-project Git config, skipping staging, diff comparison test activity, undo/rollback workflows, and browser QA test matrix.
- **Student Project Booklet (`src/booklet.md`):**
  - Full evidence workbook covering AC 1.1–1.7 and AC 2.1–2.3 with prompt boxes, tables, and teacher feedback rubric.

---

## 2. Immediate Next Steps for Next Session

1. **Review Draft Resources:**
   - Review the generated files in `Design Software/` (`template/`, `guides/`, `examples/`, `src/booklet.md`).
2. **Delivery Style Polish:**
   - Optional: Add interactive "Quick Understanding Checks" (mini quiz / self-check box) to the 4 HTML guides.
3. **Booklet `.docx` Conversion:**
   - Set up Pandoc or run export to generate `Design Software/booklet.docx`.
4. **Subsequent Units:**
   - Move on to spec drafting and resource creation for the remaining 3 units outlined in `AGENTS.md`:
     - *Imaging Software (R/505/3062)* — Photoshop poster/ad design.
     - *Multi-media Software Skills (R/505/1688)* — Webpage with images and audio.
     - *Word Processing Software (D/505/6398)* — Research report/guide.
