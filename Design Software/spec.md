# Design Software R/505/6389 — Canteen Ordering System

JavaScript-based project using VS Code, with introductory program design, HTML and CSS.

Level 1 · 3 credits · GLH: 20

## Theme

“Canteen Ordering System” — students design and personalise a simple app that lets users choose food from a menu, add items to a tray, see the total and check a £5.50 student voucher limit.

The project introduces programming and web development to support possible progression to Level 2. Students can produce a successful individual design and evidence the criteria while using supplied working code for programming challenges they have not completed. Orders and payments are simulated; food information is researched for a classroom project.

## Project structure

```text
project/
├── index.html
├── style.css
├── app.js
├── util.js
├── fonts/                 # supplied local theme fonts and licences
└── images/
    ├── menu-item-images...
    └── image-unavailable.svg
```

Students copy all starter files, including images, into project/. Keep HTML and JavaScript clean, organised and commented. Load app.js before util.js.

### HTML and interface

index.html contains the page title, canteen name, introduction and footer; category selector (all/main/snack/drink); menu cards with image, name, description, price, category, healthy-choice indicator, recorded allergens and Add to tray button; tray entries with individual remove buttons; item count, subtotal, discount when enabled and final total; £5.50 voucher checkbox; clear and simulated order buttons; combined feedback; and a labelled programming practice/check area.

Students edit the canteen name, introductory text, footer and body classes. Use matching comments/search markers in the guide. Use semantic HTML, labelled controls, visible focus and readable feedback. Warnings must not depend on colour alone.

### CSS

style.css controls layout, colours, typography, spacing and decoration, in clearly commented sections. Students first select presets through HTML classes, then edit CSS directly. Both routes are required learning activities.

Provide a short MY DESIGN section at the end of the stylesheet for colour, padding/gaps, background images, font family and font size. Show the selector/property/value structure and exact location to edit. Students make at least one purposeful direct CSS change, compare before/after, check readability and explain their choice. All five types of edit have supported practice opportunities; they are not five separate assessment hurdles.

Include live CSS playgrounds in the style guide. Students edit a small rule and see the result immediately, with a reset button, labelled preview and optional hints. Set a visual goal, ask for a prediction, then ask students to apply and adapt a choice to their own app. Do not supply the finished challenge rule. Use a constrained preview so malformed CSS cannot alter the guide itself. Explain that playground edits are temporary and do not save into project files.

### JavaScript

app.js contains configurable confirmation text, menu data, practice switches and short student functions. util.js contains rendering, events, filtering, adding/removing/clearing, money formatting, supplied working logic, calls to student functions, error messages and challenge checks. Students normally edit app.js, not util.js; acknowledge the supplied support code.

Menu data must use this consistent structure:

```javascript
var orderItems = [
  {
    name: "Example menu item",
    price: 2.50,
    image: "images/example-item.jpg",
    type: "main",
    description: "A short description of the item.",
    healthpromo: true,
    alergy_warning: ["gluten", "dairy"]
  }
];
```

Text is quoted. price is a non-negative number in pounds, without quotes or £. type is exactly "main", "snack" or "drink". healthpromo is true/false without quotes. image is a local path including images/ and the extension. alergy_warning is a list of consistent lower-case labels, or [] when none are recorded. Retain the existing key spelling alergy_warning throughout. An empty list is not a guarantee that food is allergen-free.

Guide students through one complete record and its visible menu card before repeating for the remaining items. Retain at least ten items: four mains, three snacks/desserts, three drinks and at least three healthy choices. Students research descriptions, prices, images, health/allergen information and sources, and record evidence in the booklet.

### Working starter and programming practice

The starter works before students attempt coding challenges. Provide:

```javascript
var challengeModes = {
  subtotal: false,
  budget: false,
  allergy: false,
  promotion: false
};
var useHealthyPromotion = false;
```

false uses supplied working logic; true tries the corresponding student function. useHealthyPromotion separately enables the optional promotion. Practise one function at a time and label active functions in the interface. Turning a switch off preserves the attempt and restores supplied behaviour. This cannot fix a syntax error: missing quotes, commas or brackets can prevent app.js loading.

Identify invalid menu fields by item/field. Show recovery instructions if the menu cannot load. If a student function throws or returns an invalid type, clearly say that supplied logic is temporarily being used. A valid but incorrect answer must remain visible for investigation, not be silently corrected. Fixed checks call the student function directly even when its switch is off; they must not pass because the app fell back to supplied logic.

Repeated selections add separate tray entries; removal removes one occurrence. Clearing resets entries, totals and order warnings. Format money to two decimal places. Apply promotion before voucher comparison. Keep voucher and allergen warnings visible together, including after confirmation. Use a local missing-image fallback without repeated requests. Core operation must work without external fonts or images.

### Git and storage

Use VS Code Source Control for regular meaningful commits. No branches or command-line Git are required apart from initial local name/email configuration. Specify the folder to open, how to save, review/stage changes, commit, find previous work and undo a recent edit. Distinguish saving, committing and backup. Follow college storage and submission arrangements.

## Initial CSS design options

Choose one class from each selected group on body; replace an existing class instead of adding conflicting alternatives.

| Group | Classes |
|---|---|
| Layout | layout-grid, layout-flex, layout-sidebar-left, layout-single-column |
| Colour | colour-light, colour-dark, colour-contrast |
| Theme | theme-modern, theme-retro, theme-americana, theme-punk, theme-emo |
| Spacing | spacing-compact, spacing-standard, spacing-spacious |
| Heading font | heading-clean, heading-bold, heading-serif |
| Body font | body-clear, body-rounded, body-mono |
| Accent | accent-blue, accent-purple, accent-green, accent-orange |
| Card shape | cards-square, cards-soft, cards-round |

```html
<body class="layout-grid colour-light theme-modern spacing-standard
             heading-clean body-clear accent-blue cards-soft">
```

Introduce existing groups first; offer extra font/accent/shape choices after an initial success. Show where to edit, what to replace, expected visual change and save/refresh/restore steps. Provide visual layout comparisons. Custom choices override relevant theme defaults; high contrast overrides decorative colours and backgrounds. Check desktop and narrow layouts.

Images stay in images/, not hotlinked. Use system-font alternatives for the core route. Google Fonts remains an optional supported extension showing the font link and matching font-family, with a local fallback. Direct CSS activities cover colour, spacing, image backgrounds, font family and font size, using live previews and a small personal design section in the app stylesheet.

## Project requirements

- Research at least ten menu items: four mains, three snacks/desserts and three drinks, including at least three healthy choices. Record descriptions, prices, categories, health/allergen information, images and sources.
- Identify audience and use; plan a mood board and labelled wireframe.
- Prepare local images and populate the app with researched information.
- Personalise layout, colours, typography, spacing, images and text. Include purposeful direct CSS editing as well as preset selection.
- Make and explain a design improvement; preserve individual choices rather than prescribing one finished appearance.
- Take part in supported JavaScript activities, recording an attempt and learning.
- Test the actual project, correct problems and retest.
- Store/retrieve files, make meaningful Git checkpoints, and submit individual evidence with sources, supplied code and support acknowledged.

Programming introduces totals, comparisons, list checks and an optional discount. Completing every coding challenge is not required to evidence the criteria. Students can retain supplied functions while demonstrating their own design creation, editing, information handling and checking. An unfinished extension is not a failed project; record specific learning from partial attempts.

## Resource set

### Four HTML guides

Retain guide-1-research-and-design.html, guide-2-customising-styles.html, guide-3-coding-challenges.html and git-and-testing-guide.html. Guide 1 contains all essential getting-started instructions, including software/location prerequisites, obtaining the repository, copying all starter files, opening the working app and initial Git setup/checkpoint. Students must not depend on README instructions. Keep README minimal and link to Guide 1 and the project hub.

Students open the rendered Guide 1 webpage from their class link before cloning. Keep the repository clone URL and short, ordered VS Code steps near the top of Guide 1. Explain which folder to open, copying all template contents into project, and keeping the guide and local app in separate browser tabs. Direct students with existing work to reopen it rather than clone or overwrite it again. The project hub and Git/testing guide point beginners to this single setup route; the teacher shares the rendered guide link and confirms storage/hand-in locations.

Before cloning, students open their existing OneDrive/L1 Digital folder in VS Code using File → Open Folder. They then clone into that same folder and open the resulting l1-design-software-student subfolder directly in VS Code. Check that this repository, not the parent L1 Digital folder containing other units, is the final open folder. Give a File → Open Folder fallback if the post-clone Open prompt is absent.

Students save their own copy of the teacher-supplied Word project booklet inside OneDrive/L1 Digital/l1-design-software-student, alongside project, template and guides, and continue recording evidence in that copy.

Guide 1 includes two focused practice activities: three Save/Commit/Backup scenarios with explanatory feedback, and a small menu-card editor showing changed values, matching JavaScript fields and the visible card. Ask for a prediction and one change at a time, then transfer the learning to project/app.js at MENU. Practice is temporary, with a menu reset; it does not edit project files or add assessment requirements. Keep essential project instructions visible without JavaScript and in print. Avoid scores, decorative animation and extra wireframe controls; the wireframe stays static and includes a footer.

Guides teach skills; the booklet collects evidence. Use Goal → Change → Run → Check, one action per step, exact files/search markers, annotated code, labelled diagrams, before/after previews and concise recovery routes. Make CSS previews, HTML text edits, JS message/comparison practice and a running-total stepper interactive. Each edit-related interaction shows the altered code beside its visible effect or result, plus a concise transfer block naming the student file, search marker, values to change, structure to preserve and any selector/path adaptations; demo class controls also show the current HTML body tag. Keep unrelated worked-example values and avoid revealing target challenge solutions. Controls must work by keyboard and have text feedback. Essential instructions remain visible; deeper explanations/hints expand on request.

Keep the main print route about 2–3 A4 pages per guide. Opened extension/help sections may be printed separately. Avoid dense prose and dense screenshots of text. Main h1 and browser title begin with Design Software; put the activity subtitle below h1.

### Starter files and examples

Provide complete working HTML/CSS/two-JS/local-image starter files. Keep editing sections short. Early success: open, change text, save, refresh, see the change.

Retain the existing Americana Diner and Punk Eats examples, appearing essentially the same, with only necessary compatibility/support changes. Preserve their menus, artwork, typography and decorative details. Bundle the original theme fonts locally with licences. Provide a browser start page and simple in-demo look controls with Reset original design so learners can access and explore both examples without editing files. Retain two contrasting visual examples with comments explaining design choices. Examples work using supplied support logic; do not include completed student challenge functions in editable app.js. Label examples clearly.

Audit guides, starter comments and assets for accidental answers. Worked examples teach concepts with different contexts; they must not provide the complete target expression with names merely swapped. Hints should support reasoning and diagnosis. Students predict, choose, adapt and explain, rather than only copy and paste.

### Assessment booklet

Use src/booklet-design-software.md and generate the matching DOCX beside it with the shared template/filter. Link to guides rather than duplicating tutorials. Keep response spaces empty of answers. Older booklet files are historical, not the current handout.

## Coding challenge level

Beginner activities progress from a visible text edit to short logic edits. Use value edits, operator/word choices, marked expressions and adapted snippets. Students do not write event handlers, rendering code or whole functions independently. Replace the fixed quota of blanks/snippets with the supported sequence below and optional further practice.

Each activity specifies a goal, different-context worked example, prediction, exact editing location, transfer task, fixed checks, progressively stronger hints and recovery. Explain syntax when first used. Use valid starter placeholders, such as 0 or "CHOOSE", that allow the file to load.

### A — Text and values

Edit only the words inside orderMessage quotes; save, refresh, add an item and confirm. Then edit one researched price and check its card. Label text/number/boolean examples:

```javascript
name: "Fruit pot"   // text
price: 1.40         // number
healthpromo: true   // true/false
```

Check new message, correct price and successful loading. Show paired quotes and the difference between true and "true". Do not teach all record syntax at once.

### B — Running total

Use an interactive parcel-weight trace: start 0; add 2 → 2; add 3 → 5; add 1 → 6. Ask for the next total before revealing each step. Teach a simple addition statement separately; do not print a completed price-summing loop in the guide.

```javascript
function studentSubtotal(tray) {
  var total = 0;
  for (var i = 0; i < tray.length; i++) {
    total += 0; // Replace only this expression.
  }
  return total;
}
```

Explain the loop visits each item, i selects its position, and += adds to a running value. Supply the loop; students construct the expression from their understanding of current item and property. Offer separate hints for locating an item and selecting a numeric field, not the final joined expression.

Contract: tray array in; numeric subtotal in pounds out. Checks: empty → 0; [1.20] → 1.20; [2.40,1.10,0.50] → 4.00. Predict before checking; use own menu afterwards.

### C — Voucher comparison

Show a £3 example number line with below/equal/above. Provide a small operator reference for >, <, >= and == using unrelated values; do not identify the correct target operator in the question/comments.

```javascript
function studentOverBudget(totalAmount) {
  var voucherLimit = 5.50;
  return totalAmount == voucherLimit; // Choose the comparison.
}
```

The initial comparison is deliberately unfinished. Contract: return true only when the final payable amount exceeds £5.50. Checks: 5 → false; 5.50 → false; 6 → true. Students predict the boundary before editing. The app warns only when the voucher is selected; supplied code passes the amount after promotion.

### D — Allergen list

Use a pictured colour list and a different-context example:

```javascript
var colours = ["blue", "green"];
colours.includes("green"); // true
colours.includes("red");   // false
```

```javascript
function studentHasNuts(allergens) {
  return allergens.includes("CHOOSE");
}
```

Students identify the required label from the menu data and adapt the check; explain exact spelling/case. Contract: whether the list contains nuts. Checks: [] → false; ["dairy"] → false; ["nuts","gluten"] → true. Supplied support keeps other allergens visible. Ask students why an empty recorded list does not prove food is safe for a person with an allergy.

### E — Healthy discount (extension)

Split counting and percentages into separate stages. At least two healthy tray entries trigger 10% off the whole subtotal; repeated selections count separately.

E1: show three item cards with true/false flags and count qualifying entries by hand. Supply the loop and condition; student completes the increment:

```javascript
var healthyCount = 0;
for (var i = 0; i < tray.length; i++) {
  if (tray[i].healthpromo == true) {
    healthyCount += 0; // Choose the increment.
  }
}
```

E2: ten-part bar, starting £10. Distinguish subtotal, discount and final total. Work a different percentage (20% of £10); allow a calculator. Supply the >= 2 condition and return structure. Students choose the fraction in the marked expression, not write the whole function.

```javascript
function studentDiscount(tray, subtotal) {
  // Supplied counting structure and student edits.
  // Return discount amount, not the final order total.
}
```

Contract: below two qualifying entries → 0; otherwise 10% of subtotal. Supplied code rounds discount to pennies, subtracts once, then checks voucher. Checks: £10 with 0/1/2 qualifying entries → discount £0/£0/£1 and final £10/£10/£9; £4.70 with two → £0.47 discount and £4.23 final. Explain promotion enable switch separately from student-function switch.

### Feedback

Show input, expected, actual and Matches/Try again. Checks call the student function directly, do not alter the tray, and do not make assessment decisions. Valid but incorrect work should remain investigable. Record useful mistakes, predictions and partial learning; do not supply finished answers in guide or booklet.

## Additional design links

Create a mood board (colour, type, imagery, mood) and labelled wireframe (heading, menu, controls, tray). Provide small visual examples and a familiar Word-shapes or paper route. ProVector remains optional. A new drawing application must not block design work.

## Assessment criteria from qualification spec

Learning Outcomes and Assessment Criteria

1. Be able to obtain, insert and combine information for designs.

    1.1. Identify what designs are needed.

    1.2. Obtain, input and prepare designs to meet requirements.

    1.3. Identify the main copyright and other constraints which apply to the use of designs.

    1.4. Combine information of two different types or from two different sources for designs.

    1.5. Identify how the designs will be used.

    1.6. Identify which file format to use for saving and exchanging designs.

    1.7. Store and retrieve files appropriately, in line with local guidelines and conventions where  available.

2. Be able to use design software tools to create, manipulate and edit designs.

    2.1. Use suitable tools and techniques to create designs.

    2.2. Use appropriate tools and techniques to manipulate and edit designs.

    2.3. Check designs meet requirements, using IT tools and making corrections as necessary.

## Booklet tasks/activities with assessment criteria mapping

Retain task numbers; evidence can be collected when ready rather than following booklet order rigidly.

### Section 1: Planning & Understanding Design Requirements

- **Task 1: Identifying Design Needs — AC 1.1.** Explore the working app, identify audience and eight needed interface/visual features using category prompts. Evidence: audience, eight-item list and reasons for two choices.
- **Task 2: How the Design Will Be Used — AC 1.5.** Choose device/context and explain two supportive design choices. Evidence: context and concise choice/reason responses.

### Section 2: Obtaining, Sourcing & Preparing Information

- **Task 3: Menu Research & Data Preparation — AC 1.2.** Research ten items (4 mains/3 snacks/3 drinks, ≥3 healthy); prepare local assets. Evidence: names, categories, descriptions, prices, health/allergen data and source references, split across readable records/pages.
- **Task 4: Copyright Constraints & Image Sourcing — AC 1.3.** Check image reuse conditions and explain copyright plus another relevant constraint. Evidence: filenames, creators where stated, source and permission/credit requirements; short explanation. Library name alone is not permission.
- **Task 5: Combining Information — AC 1.4.** Combine researched text, numbers and images. Evidence: focused card screenshot, information types/sources explanation and actual files.
- **Task 6: File Formats — AC 1.6.** Explain HTML/CSS/JS/chosen image roles and suitability, and what must stay together when sharing. Evidence: four-row purpose/reason table and short sharing response.

### Section 3: Creating & Manipulating Designs

- **Task 7: Mood Board & Wireframe — AC 1.1, 2.1.** Plan visual style and labelled layout using a supported tool or paper. Evidence: separate spaces for both artefacts and an explained choice. A concept map is optional preparation.
- **Task 8: Applying & Improving Look and Feel — AC 1.2, 2.1, 2.2.** Populate menu, apply presets, make purposeful direct CSS edits (colour/spacing/background/font/size), and improve design. Evidence: class/choice record, selector/property/value and reason for at least one CSS edit, focused before/after or observation, actual files. This is main creation/editing evidence independent of coding-challenge completion.
- **Task 9: Programming Learning Record — supplementary.** Attempt a supported JS activity and record prediction, result, learning/change and support. Evidence: concise record with optional code/screenshot/demonstration. Relevant individual work can supplement 2.1/2.2. Do not require all activities or discount extension. Acknowledge supplied functions; no prefilled solutions.

### Section 4: File Management, Testing & Evaluation

- **Task 10: Storage & Git — AC 1.7.** Organise, locate/reopen and checkpoint files. Evidence: folder/file record, dated retrieval observation, three meaningful commit messages and Source Control/history screenshot. Git support does not replace learner retrieval evidence.
- **Task 11: Testing & Corrections — AC 2.3.** Design/data checks: menu accuracy/requirements, local images, readability/layout and narrow window. Operation: filtering, add/remove/clear, totals, voucher boundary, allergens/confirmation; promotion only if enabled. Evidence: expected/actual, useful corrections and retests. Fixed function checks do not replace own-project testing and corrections.
- **Task 12: Review & Evaluation — AC 2.3.** Compare actual project with brief/audience, fix remaining problems, identify strength/next step. Evidence: final checklist, short reflection and complete folder/booklet. Supplied programming logic is allowed.

### Section 5: Assessor Feedback & Declaration

List all ten criteria individually with evidence location, action, decision, signature and date. Finish with learner authenticity checkbox, name, ID, date and signature; acknowledge sources, starter code and help.

Aim to complete assessed work within weeks 6–7; remaining time supports extensions and additional practice. Confirm college software/storage/hand-in arrangements, teacher cover artwork and asset permissions; test on a college machine and inspect rendered booklet before delivery.
