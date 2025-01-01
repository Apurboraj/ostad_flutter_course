// Define the Product class
class Product {
  final int id;
  final String name;
  int quantity;
  final double price;

  Product({required this.id, required this.name, required this.quantity, required this.price});

  double get totalValue => quantity * price;

  @override
  String toString() => '$name (ID: $id): Quantity: $quantity, Price: \$${price.toStringAsFixed(2)}';
}

// Define the Inventory class
class Inventory {
  final Map<int, Product> _products = {};

  void addProduct(Product product) {
    if (_products.containsKey(product.id)) {
      print('Product with ID ${product.id} already exists.');
      return;
    }
    _products[product.id] = product;
    print('Added product: ${product.name}');
  }

  void updateProductQuantity(int productId, int quantity) {
    try {
      final product = _products[productId];
      if (product == null) {
        throw Exception('Product with ID $productId does not exist.');
      }
      if (quantity < 0) {
        throw Exception('Quantity cannot be negative.');
      }
      product.quantity = quantity;
      print('Updated ${product.name} quantity to $quantity.');
    } catch (e) {
      print(e);
    }
  }

  void calculateTotalValue() {
    final totalValue = _products.values.fold(0.0, (sum, product) => sum + product.totalValue);
    print('Total inventory value: \$${totalValue.toStringAsFixed(2)}');
  }

  void listProducts() {
    if (_products.isEmpty) {
      print('No products in inventory.');
      return;
    }
    print('Inventory Products:');
    for (var product in _products.values) {
      print('- $product');
    }
  }
}

void main() {
  final inventory = Inventory();

  // Add products to inventory
  inventory.addProduct(
      Product(id: 1, name: 'Laptop', quantity: 10, price: 999.99));
  inventory.addProduct(
      Product(id: 2, name: 'Smartphone', quantity: 50, price: 499.99));
  inventory.addProduct(
      Product(id: 3, name: 'Headphones', quantity: 30, price: 79.99));

  // List all products
  inventory.listProducts();

  // Update product quantity
  inventory.updateProductQuantity(2, 45); // Update Smartphone quantity
  inventory.updateProductQuantity(4, 20); // Non-existent product
  inventory.updateProductQuantity(1, -5); // Invalid quantity

  // Calculate total inventory value
  inventory.calculateTotalValue();
}