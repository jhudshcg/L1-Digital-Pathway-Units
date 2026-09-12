# Design Software R/505/6389 - Canteen Ordering System

JS based project, using VSCode, with a simple program design and implementation.

GLH: 20

**Theme:** 

"Canteen Ordering System" - students will design a simple program to allow users to order food from a canteen menu, with options for customization and payment.

**Project structure:**

1 HTML file, 1 CSS file, 1* JS file.

Image buttons and text inputs for user interaction, with grid or flex layout.

Status messages and alerts for user feedback (order totals, info, warnings or errors).

Starter templates provided for all source files. 

HTML and JS should be very clean and well organized as well as commented.

CSS should be well structured and commented, with clear sections for different aspects of the design. The css should be designed so that students can select different classes for elements to change the layout, look and feel of the program, without needing to edit the css file. But there should be scope for making minor edits to change colours, fonts images and spacing.

The orderable items should be data driven from JS (inside app.js). The data format is:

```javascript
var orderItems = [
  {
    name: "Item Name",
    price: 0.00,
    image: "image.jpg",
    type: "main" | "drink" | "snack",
    description: "Item description",
    healthpromo: true | false,
    alergy_warning: ['nuts', 'gluten', 'dairy', 'soy', 'eggs', 'fish', 'shellfish', 'sesame', 'sulphites']
  }
];
```

* In the interest of reducing risk of overwhelm and keeping the JS accessible, the JS should be split into 2 files, with a util.js for utility functions, including element creation, attaching event listeners, and other common functions, and an app.js for the main program logic, confirurable UI text and data for the order options. Students will edit the app.js file to implement their own design choices and functionality.

Students will research items, costs and allergy information for their menu, and will be required to evidence this research in their project booklet.

Students will customize the design of their program, including layout, colours, fonts, images and text. They will evidence their design choices in their project booklet. They may also edit the HTML file to change things like title or footer text.

They will use git in VSCode to version manage their project. No branches or command line (apart from git config to set up user name and email) will be required, but students will be expected to commit regularly and write meaningful commit messages, via the VSCode GUI.

**Initial CSS design options:**

selectable (by changing the html class attributes on `<body>`):
- layout options: `layout-grid`, `layout-flex`, `layout-sidebar-left`, `layout-single-column`
- colour schemes: `colour-light`, `colour-dark`, `colour-contrast`
- design themes (typography, mood and adornment): `theme-modern`, `theme-retro`, `theme-americana`, `theme-punk`, `theme-emo`
- spacing options: `spacing-compact`, `spacing-standard`, `spacing-spacious`

Images are stored locally within an `images/` directory in the project rather than hotlinked externally.

The CSS will make use of Google Fonts, and will include a few different font options for headings and body text, which students can select by changing the class attributes in the HTML file. There should be simple guidance on using Google Fonts to add additional fonts or change existing choices, if students wish to do so.

**Project requirements:**

- Research and evidence a menu of at least 10 items, with prices, images, health and allergy information. Document choices and the information sources in the project booklet.
- Choose and customize the program layout, look and feel, including colours, fonts, images and text. Document your design with a mood board and a wireframe, copied into the project booklet (can use provector.app for this).
- Implement some of the program logic for: 
    - finding the total cost
    - checking in within budget (if £5.50 student voucher is selected)
    - warning if an allergy is present in the order
    - optionally, applying a health promotion discount if a healthy option is selected.

**Resource set:** 

- HTML docs for key steps and skills required, with clear instructions, examples and learning activities. These are more for detailed guidance, cheat sheets andadditional activities and in depth learning, separate from the project booklet doc (which is more directly focused on evidencing the assessment criteria and project requirements). No more than 3-4 additional HTML guide docs. 2-3 pages length each, max.
- Template HTML, CSS and JS files for students to use as a starting point for their project. Templates will be well commented and include different options for code that can be used for each key aspect of the project.
- 2 demo/example completed projects, with clear code comments. Each example should show a different set of design choices. The examples should not have completed code challenges, so should mostly demonstrate design and layout choices, with some very basic program logic implemented to showcase the design - without giving away the coding challenge solutions. The examples should be well commented to explain the design choices and how they were implemented in the code.

**Coding challenge level**

The level will be basic, beginner, with a mix of fill-in-the-blank and use of snippet bank, from which students select a best match and copy, paste and modify to fit the specific use.

e.g.

```javascript
// fill in the blank
if (orderAllergies.includes(____)) {
  alert('Warning: Your order contains nuts!');
}
...

if (orderTotal ____ 5.50) {
  alert('Your order exceeds the £5.50 student voucher limit.');
}

// snippet bank
// totalling numbers in an array
// student will need to copy, paste and modify the code to total the order item prices (not weight) in the order array.
var total = 0.0;
for (var i = 0; i < items.length; i++) { // 'items' may be called something else in the program code, so students would need to modify this.
  total += items[i].weight; // will need to modify this
}

// at least 2 healthy items in the menu, with a health promotion discount applied if selected. (students need to copy, paste and modify the code to check for healthy items in the order and apply the discount if present).
var numMatchingItems = 0;
for (var i = 0; i < items.length; i++) {
  if (items[i].someproperty) { // will need to modify this to check for healthy items in the order
    numMatchingItems++;
  }
}
if (numMatchingItems > 1) {
  orderTotal *= 0.9; // apply 10% discount
}

```

Overall, students should complete 3 - 4 fill in the blanks and 2 - 3 snippet bank exercises, with a total of 5 - 7 coding challenges to complete in the project.

Challenges needs to be well scaffolded, but do not give away the solutions in the questions. Students need to do some thinking and problem solving.

** Additional design links **

Students will produce a mood board and wireframe for their design, which will be included in the project booklet. They can use provector.app to create these, and copy them into the project booklet.

**Assessment criteria from qualification spec:**

Learning Outcomes and Assessment Criteria 

1. Be able to obtain, insert and combine information for designs.

    1.1. Identify what designs are needed.  

    1.2. Obtain, input and prepare designs to meet  requirements.  

    1.3. Identify the main copyright and other  constraints which apply to the use of designs.  

    1.4. Combine information of two different types or  from two different sources for designs.  

    1.5. Identify how the designs will be used.  

    1.6. Identify which file format to use for saving and  exchanging designs. 

    1.7. Store and retrieve files appropriately, in line  with local guidelines and conventions where  available. 

2. Be able to use design software tools to create, manipulate and edit designs. 

    2.1. Use suitable tools and techniques to create  designs.  

    2.2. Use appropriate tools and techniques to  manipulate and edit designs.  

    2.3. Check designs meet requirements, using IT  tools and making corrections as necessary. 


## Booklet tasks/activities with assessment criteria mapping

The sequence of tasks and activities in the student project booklet, the student evidence required, and the assessment criteria mapping:

### Section 1: Planning & Understanding Design Requirements
* **Task 1: Identifying Design Needs (AC 1.1)**
  - *Activity:* Define the primary target audience (students, staff, visitors) and list at least 8 essential UI features and visual elements required for the canteen ordering system.
  - *Student Evidence:* Target audience written response box; 8-item numbered list of required features and interface elements.
  - *Criteria Mapping:* **AC 1.1**

* **Task 2: How the Design Will Be Used (AC 1.5)**
  - *Activity:* Identify the physical and digital contexts of use (counter kiosks, tablets, smartphones, desktop browsers) and explain how layout and color choices improve speed and usability during peak lunchtime periods.
  - *Student Evidence:* Device & context written explanation box; user experience & visual layout explanation box.
  - *Criteria Mapping:* **AC 1.5**

---

### Section 2: Obtaining, Sourcing & Preparing Information
* **Task 3: Menu Research & Data Preparation (AC 1.2, 1.4)**
  - *Activity:* Research and structure 10 menu items (at least 4 mains, 3 snacks/desserts, 3 drinks), including at least 3 healthy choices, prices, categories, and allergen information.
  - *Student Evidence:* 10-row structured table recording Item Name, Category, Price (£), Healthy Choice (Yes/No), and Allergen warnings.
  - *Criteria Mapping:* **AC 1.2, AC 1.4**

* **Task 4: Copyright Constraints & Image Sourcing (AC 1.3)**
  - *Activity:* Source royalty-free image assets for all 10 menu items from permitted stock libraries (e.g., Unsplash, Pexels) and explain copyright, licensing, and intellectual property constraints.
  - *Student Evidence:* 10-row asset log table recording local filenames (`images/...`), source URLs, and specific licenses; written explanation box covering copyright law and permission requirements.
  - *Criteria Mapping:* **AC 1.3**

* **Task 5: Combining Information from Multiple Sources (AC 1.4)**
  - *Activity:* Explain how multiple distinct information types (text names/descriptions, numerical prices, graphic images, health/allergen badges) from different sources are combined into unified menu cards.
  - *Student Evidence:* Structured response box identifying and explaining the 4 combined data streams in the canteen card component.
  - *Criteria Mapping:* **AC 1.4**

* **Task 6: Identifying File Formats (AC 1.6)**
  - *Activity:* Identify and justify the file formats used in the web app design project (`.html`, `.css`, `.js`, `.jpg`/`.png`/`.webp`), explaining their specific role and suitability for saving and exchanging digital designs.
  - *Student Evidence:* 4-row table detailing the role and technical suitability of each file format.
  - *Criteria Mapping:* **AC 1.6**

---

### Section 3: Creating & Manipulating Designs
* **Task 7: Concept Brainstorming & Wireframing (AC 1.1, 1.2, 2.1)**
  - *Activity:* Plan the visual theme, typography, interactivity, and assets using a 5-point concept map, then sketch or construct a UI layout wireframe blueprint using ProVector (`provector.app`) or design software.
  - *Student Evidence:* Completed 5-box concept cross map (`layout-5-textbox-cross`); screenshot / diagram box of the finished wireframe blueprint.
  - *Criteria Mapping:* **AC 1.1, AC 1.2, AC 2.1**

* **Task 8: Applying Look & Feel Customisations (AC 2.1, 2.2)**
  - *Activity:* Select and apply CSS theme, layout, colour, and spacing classes on `<body>` in `index.html` to manipulate the visual look and feel, loading researched food items into the interface.
  - *Student Evidence:* 4-row customization record table documenting selected classes and design rationale; full-page screenshot of the customized user interface with food cards displayed.
  - *Criteria Mapping:* **AC 2.1, AC 2.2**

* **Task 9: Implementing Interactive Logic (AC 2.1, 2.2)**
  - *Activity:* Complete beginner JavaScript coding challenges in `app.js` (calculating tray subtotals, checking £5.50 meal voucher budget limits, flagging allergen warnings, applying 10% healthy choice discounts, and showing order confirmations).
  - *Student Evidence:* 5-row logic implementation table recording code snippets/operators used; screenshot of completed JavaScript logic in `app.js`.
  - *Criteria Mapping:* **AC 2.1, AC 2.2**

---

### Section 4: File Management, Testing & Evaluation
* **Task 10: File Storage & Git Version Control (AC 1.7)**
  - *Activity:* Organize project files into proper folder conventions (`images/`, root scripts/styles) and use VS Code Source Control to make regular, meaningful Git commits tracking project progress.
  - *Student Evidence:* File organisation explanation box; 3-item log of meaningful commit messages; screenshot of VS Code Git commit history / Source Control panel.
  - *Criteria Mapping:* **AC 1.7**

* **Task 11: Testing & Making Corrections (AC 2.3)**
  - *Activity:* Execute a 6-point test plan testing category filtering, subtotal calculations, voucher limits, allergen banners, healthy discounts, and clearing the tray, noting any bug fixes made.
  - *Student Evidence:* 6-row test plan table recording Test Action, Expected Result, Actual Result, Pass/Fail status, and Corrections Made.
  - *Criteria Mapping:* **AC 2.3**

* **Task 12: Review & Evaluation (AC 2.3)**
  - *Activity:* Evaluate the final canteen ordering system against the initial brief and target audience requirements, and identify potential future enhancements.
  - *Student Evidence:* Written evaluation box reflecting on target audience fit; written response box proposing 1–2 future technical/design improvements.
  - *Criteria Mapping:* **AC 2.3**

---

### Section 5: Declaration & Assessor Feedback
* **Student Declaration of Authenticity:** Formal authenticity confirmation checkbox, learner name, ID, date, and signature (`layout-declaration`).
* **Assessor Feedback & Grading Grid:** Assessment matrix mapping LO1 and LO2, overall Pass/Resubmission decision, assessor signature, and date.
