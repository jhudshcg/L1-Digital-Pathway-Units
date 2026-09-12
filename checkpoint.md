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

### B. Unit 1: Design Software (`Design Software/`) — Draft Resources Created & Submodule Ready
- **Student Repository (`Design Software/l1-design-software-student/`):**
  - Remote naming convention: `l1-design-software-student` (tagged with GitHub topic `level-1`).
  - Git initialized as standalone student repo ready to be linked as a Git submodule and pushed to GitHub.
  - `.gitignore` (ignores `.docx`, temporary and OS files).
  - `README.md` (clear getting-started steps for Level 1 learners).
  - `project/` (working directory with starter instructions).
  - `template/` (`index.html`, `style.css`, `app.js`, `util.js`, `images/`).
  - `examples/` (`demo-americana-diner/` and `demo-punk-eats/`).
  - `guides/` (`guide-1-research-and-design.html`, `guide-2-customising-styles.html`, `guide-3-coding-challenges.html`, `git-and-testing-guide.html`).
- **Teacher Planning & Evidence (Kept in main repo only):**
  - `Design Software/spec.md`: Project specification, theme, data structure, and assessment criteria.
  - `Design Software/src/booklet.md`: Student project booklet source in Markdown ready for Pandoc `.docx` conversion.

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
