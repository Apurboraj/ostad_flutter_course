// Define the Product class
class Product {
  final int id;
  final String name;
  final double price;
  int quantity;

  Product({required this.id, required this.name, required this.price, required this.quantity});

  double get totalPrice => price * quantity;

  @override
  String toString() => '$name (ID: $id): \$${price.toStringAsFixed(2)} x $quantity';
}

// Define the Cart class
class Cart {
  final List<Product> _products = [];
  double _discount = 0.0;

  void addProduct(Product product) {
    final existingProduct = _products.firstWhere(
          (p) => p.id == product.id,
      orElse: () => Product(id: product.id, name: product.name, price: product.price, quantity: 0),
    );

    if (existingProduct.quantity == 0) {
      _products.add(product);
    } else {
      existingProduct.quantity += product.quantity;
    }

    print('Added ${product.quantity} of ${product.name} to the cart.');
  }

  void removeProduct(int productId) {
    final productIndex = _products.indexWhere((p) => p.id == productId);
    if (productIndex != -1) {
      final removedProduct = _products.removeAt(productIndex);
      print('Removed ${removedProduct.name} from the cart.');
    } else {
      print('Product with ID $productId not found in the cart.');
    }
  }

  void applyDiscountCode(String code) {
    try {
      if (code == 'SAVE10') {
        _discount = 0.10;
        print('Discount code applied: 10% off.');
      } else {
        throw Exception('Invalid discount code: $code.');
      }
    } catch (e) {
      print(e);
    }
  }

  double calculateTotal() {
    final total = _products.fold(0.0, (sum, product) => sum + product.totalPrice);
    final discountedTotal = total * (1 - _discount);
    print('Total Price: \$${discountedTotal.toStringAsFixed(2)}');
    return discountedTotal;
  }

  void displayCart() {
    if (_products.isEmpty) {
      print('Your cart is empty.');
      return;
    }

    print('Cart Contents:');
    for (var product in _products) {
      print('- $product');
    }
  }
}

void main() {
  final cart = Cart();

  // Add products to the cart
  cart.addProduct(Product(id: 1, name: 'Laptop', price: 999.99, quantity: 1));
  cart.addProduct(Product(id: 2, name: 'Mouse', price: 49.99, quantity: 2));

  // Display cart contents
  cart.displayCart();

  // Remove a product
  cart.removeProduct(2);

  // Apply a discount code
  cart.applyDiscountCode('SAVE10');
  cart.applyDiscountCode('INVALIDCODE'); // Invalid code

  // Calculate total price
  cart.calculateTotal();
}
