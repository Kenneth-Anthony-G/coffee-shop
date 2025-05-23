class Coffee {
  final String name;
  final String details;
  final String description;
  final String image;
  final String price;

  Coffee({required this.name, required this.details, required this.description, required this.image, required this.price});


}

final List<Coffee> coffees = [
  // Lattes
  Coffee(
    name: 'Vanilla Latte',
    details: 'With vanilla syrup',
    description: 'A vanilla latte combines espresso, steamed milk, and vanilla syrup to create a sweet and smooth coffee drink.',
    image: 'assets/images/vanilla_latte.jpg',
    price: '4.50',
  ),
  Coffee(
    name: 'Caramel Latte',
    details: 'Topped with caramel drizzle',
    description: 'A caramel latte is made with espresso and steamed milk, flavored with caramel syrup and topped with caramel sauce.',
    image: 'assets/images/caramel_latte.jpg',
    price: '4.80',
  ),
  Coffee(
    name: 'Hazelnut Latte',
    details: 'Nutty and smooth',
    description: 'Hazelnut latte blends espresso and steamed milk with hazelnut syrup, offering a nutty and rich flavor profile.',
    image: 'assets/images/hazelnut_latte.jpg',
    price: '4.70',
  ),

  // Cappuccinos
  Coffee(
    name: 'Classic Cappuccino',
    details: 'Espresso and foam',
    description: 'The classic cappuccino includes a shot of espresso topped with equal parts of steamed milk and milk foam.',
    image: 'assets/images/classic_cappuccino.jpg',
    price: '4.20',
  ),
  Coffee(
    name: 'Chocolate Cappuccino',
    details: 'With a hint of cocoa',
    description: 'A chocolate cappuccino combines rich espresso with steamed milk and a touch of chocolate powder or syrup.',
    image: 'assets/images/chocolate_cappuccino.jpg',
    price: '4.60',
  ),
  Coffee(
    name: 'Cinnamon Cappuccino',
    details: 'Warm spice touch',
    description: 'Cinnamon cappuccino adds a sprinkle of cinnamon to the traditional blend, giving a spicy twist to your drink.',
    image: 'assets/images/cinnamon_cappuccino.jpg',
    price: '4.40',
  ),

  // Milk-based Drinks
  Coffee(
    name: 'Warm Milk',
    details: 'Light and comforting',
    description: 'A simple glass of steamed milk, great for relaxing or pairing with cookies.',
    image: 'assets/images/warm_milk.jpg',
    price: '2.00',
  ),
  Coffee(
    name: 'Honey Milk',
    details: 'Sweetened with honey',
    description: 'This milk drink is steamed and sweetened naturally with honey, offering a smooth and soothing taste.',
    image: 'assets/images/honey_milk.jpg',
    price: '2.50',
  ),
  Coffee(
    name: 'Almond Milk Drink',
    details: 'Dairy-free option',
    description: 'A non-dairy alternative using almond milk, perfect for lactose-intolerant customers or those seeking a nutty flavor.',
    image: 'assets/images/almond_milk.jpg',
    price: '3.00',
  ),
];
