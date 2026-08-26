/**
 * RIOT BITES - EXEMPLAR APP (app.js)
 * 
 * DESIGN RATIONALE:
 * - Theme: Edgy Punk Street Food
 * - Target Audience: College students wanting bold, spicy, fast-paced food
 * - Design Choices:
 *   - Layout: .layout-flex (flexible wrapping card rows)
 *   - Theme: .theme-dark (dark street vibe)
 *   - Style: .style-punk (uses 'Creepster' and 'Special Elite' fonts, skewed cards)
 *   - Spacing: .spacing-compact (snug layout fit)
 */

var orderItems = [
  {
    name: "Atomic Buffalo Hot Wings",
    price: 3.90,
    image: "https://images.unsplash.com/photo-1567620832903-9fc6debc209f?w=400",
    type: "main",
    description: "6 crispy wings tossed in fiery habanero glaze served with cool ranch dip.",
    healthpromo: false,
    alergy_warning: ['eggs', 'dairy', 'sulphites']
  },
  {
    name: "Korean BBQ Tofu Bowl",
    price: 3.30,
    image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=400",
    type: "main",
    description: "Crispy glazed tofu cubes, steamed edamame, kimchi and brown rice.",
    healthpromo: true,
    alergy_warning: ['soy', 'sesame']
  },
  {
    name: "Loaded Anarchy Nachos",
    price: 3.50,
    image: "https://images.unsplash.com/photo-1513456852971-30c0b8199d4d?w=400",
    type: "main",
    description: "Tortilla chips loaded with jalapeños, warm cheese sauce and spicy salsa.",
    healthpromo: false,
    alergy_warning: ['dairy']
  },
  {
    name: "Superfood Protein Power Bowl",
    price: 3.20,
    image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400",
    type: "main",
    description: "Quinoa, roasted sweet potato, baby kale, chickpeas and lemon tahini dressing.",
    healthpromo: true,
    alergy_warning: ['sesame']
  },
  {
    name: "Sonic Salt & Pepper Fries",
    price: 1.50,
    image: "https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400",
    type: "snack",
    description: "Chunky skin-on fries seasoned with chilli flakes, spring onion and sea salt.",
    healthpromo: false,
    alergy_warning: []
  },
  {
    name: "Charred Street Corn on Cob",
    price: 1.40,
    image: "https://images.unsplash.com/photo-1551754655-cd27e38d2076?w=400",
    type: "snack",
    description: "Flame-grilled sweetcorn dusted with mild smoked paprika and lime juice.",
    healthpromo: true,
    alergy_warning: []
  },
  {
    name: "Dark Chocolate Brownie Bomb",
    price: 1.70,
    image: "https://images.unsplash.com/photo-1606313564200-e75d5e30476c?w=400",
    type: "snack",
    description: "70% dark cocoa brownie loaded with fudge chunks and sea salt.",
    healthpromo: false,
    alergy_warning: ['gluten', 'dairy', 'eggs']
  },
  {
    name: "Cold Brew Rocket Fuel",
    price: 1.80,
    image: "https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?w=400",
    type: "drink",
    description: "12-hour steeped artisan Colombian cold brew coffee served black over ice.",
    healthpromo: true,
    alergy_warning: []
  },
  {
    name: "Electric Dragonfruit Lemonade",
    price: 1.40,
    image: "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=400",
    type: "drink",
    description: "Tart fresh lemonade infused with vibrant pink pitaya dragonfruit extract.",
    healthpromo: true,
    alergy_warning: []
  },
  {
    name: "Monster Mango Energy Blast",
    price: 1.60,
    image: "https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=400",
    type: "drink",
    description: "Sparkling tropical juice drink packed with B-vitamins and green tea extract.",
    healthpromo: false,
    alergy_warning: []
  }
];

// NOTE: This demo showcases theme styling and data layout.
// Student coding challenge functions (calculating subtotal, budget checks, etc.)
// are left for students to solve in their own project templates.
