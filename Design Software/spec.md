# Design Software unit - Canteen Ordering System

JS based project, using VSCode, with a simple program design and implementation.

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

selectable (by changing the html class attributes) styles:
- grid layout, flex layout, single column layout
- light theme, dark theme, high contrast theme
- typography, colour and adornment styles: retro, americana, modern, punk, emo (should require 1 or 2 class attr changes)
- spacing options: compact, standard, spacious (should require 1 class attr change and work with all layout and typography options)

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
```
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

```javascript

Overall, students be complete 3 - 4 fill in the blanks and 2 - 3 snippet bank exercises, with a total of 5 - 7 coding challenges to complete in the project.

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
