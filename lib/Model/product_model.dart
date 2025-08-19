class Product {
  final String name;
  final String price;
  final String imageUrl;
  final String id ; // Unique ID for each product

  Product({required this.id,required this.name, required this.price, required this.imageUrl});
  static final List<Product> products = [
    Product(
      id: '1',
      name: 'Cozy Knit Sweater',
      price: '\$49.99',
      imageUrl: 'assets/sweater.png',
    ),
    Product(
      id: '2',
      name: 'Classic Leather Boots',
      price: '\$129.99',
      imageUrl: 'assets/boot.png',
    ),
    Product(
      id: '3',
      name: 'Minimalist Backpack',
      price: '\$79.99',
      imageUrl: 'assets/bag.png',
    ),
    Product(
      id: '4',
      name: 'Urban Streetwear Jacket',
      price: '\$89.99',
      imageUrl: 'assets/jacket.png',
    ),
  ];
}