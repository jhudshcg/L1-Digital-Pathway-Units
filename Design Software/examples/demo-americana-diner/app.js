/**
 * ROUTE 66 DINER - EXEMPLAR APP (app.js)
 * 
 * DESIGN RATIONALE:
 * - Theme: 1950s All-American Diner
 * - Target Audience: College students wanting quick, hearty diner meals
 * - Design Choices:
 *   - Layout: .layout-grid (clean columns for easy browsing)
 *   - Theme: .theme-light (approachable, classic look)
 *   - Style: .style-americana (uses 'Bungee' heading font & red borders)
 *   - Spacing: .spacing-standard (standard readable gap)
 */

var orderItems = [
  {
    name: "Route 66 Double Cheeseburger",
    price: 3.80,
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400",
    type: "main",
    description: "Two smashed beef patties with melted Monterey Jack cheese, pickles, and diner relish.",
    healthpromo: false,
    alergy_warning: ['gluten', 'dairy', 'sesame']
  },
  {
    name: "Grilled Chicken Ranch Salad",
    price: 3.40,
    image: "https://images.unsplash.com/photo-1540420773420-3366772f4999?w=400",
    type: "main",
    description: "Crispy greens, cherry tomatoes, grilled chicken strips and light herby dressing.",
    healthpromo: true,
    alergy_warning: ['eggs', 'dairy']
  },
  {
    name: "Smoky BBQ Pulled Pork Sub",
    price: 3.60,
    image: "https://images.unsplash.com/photo-1528735602780-2552fd46c7af?w=400",
    type: "main",
    description: "Slow-cooked pulled pork in tangy BBQ glaze, served inside a toasted brioche roll.",
    healthpromo: false,
    alergy_warning: ['gluten', 'sulphites']
  },
  {
    name: "Veggie Bean Chilli Bowl",
    price: 3.10,
    image: "https://images.unsplash.com/photo-1543339308-43e59d6b73a6?w=400",
    type: "main",
    description: "Spiced three-bean chilli served over brown rice with guacamole on top.",
    healthpromo: true,
    alergy_warning: []
  },
  {
    name: "Crinkle Cut Diner Fries",
    price: 1.40,
    image: "https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400",
    type: "snack",
    description: "Golden crispy crinkle-cut potato fries with a pinch of seasoned sea salt.",
    healthpromo: false,
    alergy_warning: []
  },
  {
    name: "Warm Cinnamon Apple Pie",
    price: 1.80,
    image: "https://images.unsplash.com/photo-1519915028121-7d3463d20b13?w=400",
    type: "snack",
    description: "Flaky shortcrust pastry filled with spiced Bramley apples and caramel syrup.",
    healthpromo: false,
    alergy_warning: ['gluten', 'dairy']
  },
  {
    name: "Fresh Melon & Berry Pot",
    price: 1.50,
    image: "https://images.unsplash.com/photo-1565895405139-e188df996e0b?w=400",
    type: "snack",
    description: "Hand-chopped honeydew melon, blueberries and ripe strawberries.",
    healthpromo: true,
    alergy_warning: []
  },
  {
    name: "Thick Vanilla Shake",
    price: 1.90,
    image: "https://images.unsplash.com/photo-1572490122747-3968b75cc699?w=400",
    type: "drink",
    description: "Traditional malted vanilla ice cream shake topped with whipped cream.",
    healthpromo: false,
    alergy_warning: ['dairy']
  },
  {
    name: "Sparkling Lemon Iced Tea",
    price: 1.20,
    image: "https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400",
    type: "drink",
    description: "Chilled brewed black tea with lemon juice and a touch of agave nectar.",
    healthpromo: true,
    alergy_warning: []
  },
  {
    name: "Classic Root Beer",
    price: 1.30,
    image: "https://images.unsplash.com/photo-1622483767028-3f66f32aef97?w=400",
    type: "drink",
    description: "Old-fashioned sarsaparilla soda served ice-cold with a lime wedge.",
    healthpromo: false,
    alergy_warning: []
  }
];

// NOTE: This demo showcases theme styling and data layout.
// Student coding challenge functions (calculating subtotal, budget checks, etc.)
// are left for students to solve in their own project templates.
