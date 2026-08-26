# Project Checkpoint: L1 Digital Skills Course Units

**Last Updated:** 2026-08-26  
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

### B. Unit 1: Design Software (`Design Software/`) — Draft Resources Created
- **Theme:** Canteen Ordering System (HTML/CSS/JS in VS Code).
- **Starter Template (`template/`):**
  - `index.html`: Base layout, menu grid, interactive tray, voucher checkbox, status banner.
  - `style.css`: Class-based theming engine (`layout-*`, `theme-*`, `style-*`, `spacing-*`, Google Fonts).
  - `util.js`: Background rendering, event listeners, state management (students do not need to edit).
  - `app.js`: 10-item data skeleton + 5 scaffolded coding challenges (subtotal calculation, £5.50 voucher budget check, allergy warnings, healthy choice promotion discount, custom checkout feedback).
- **Exemplar Projects (`examples/`):**
  - `demo-americana-diner/`: Grid layout, light theme, Americana 50s diner aesthetic, Bungee typography.
  - `demo-punk-eats/`: Flex layout, dark theme, Punk street-food aesthetic, Creepster typography.
- **HTML Guides (`guides/`):**
  - `guide-1-research-and-design.html`: Menu research, copyright sourcing, mood board, wireframing (`provector.app`).
  - `guide-2-customising-styles.html`: Class-based CSS theming, Google Fonts, colour tweaks.
  - `guide-3-coding-challenges.html`: JavaScript snippet bank and fill-in-the-blank challenge walkthroughs.
  - `guide-4-testing-and-git.html`: QA testing matrix, VS Code GUI Git commit workflow.
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
