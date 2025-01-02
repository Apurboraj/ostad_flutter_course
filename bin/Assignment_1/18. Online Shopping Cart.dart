class Product {
  int id;
  String name;
  double price;
  int quantity;

  Product(this.id, this.name, this.price, this.quantity);
}

class Cart {
  List<Product> products = [];
  double discount = 0.0;

  void addProduct(Product product) {
    products.add(product);
    print('${product.name} added to the cart.');
  }

  void removeProduct(Product product) {
    if (products.contains(product)) {
      products.remove(product);
      print('${product.name} removed from the cart.');
    } else {
      throw Exception('${product.name} is not in the cart.');
    }
  }

  double calculateTotalPrice() {
    double totalPrice = products.fold(0.0, (sum, product) => sum + (product.price * product.quantity));
    return totalPrice * (1 - discount);
  }

  void applyDiscountCode(String code) {
    if (code == 'SAVE10') {
      discount = 0.10;
      print('Discount code applied: 10% off.');
    } else {
      throw Exception('Invalid discount code.');
    }
  }

  void displayCartSummary() {
    print('Cart Summary:');
    products.forEach((product) {
      print('Item: ${product.name}, Price: \$${product.price}, Quantity: ${product.quantity}');
    });
    print('Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}');
  }
}

void main() {
  try {
    Cart cart = Cart();

    Product product1 = Product(1, 'Laptop', 999.99, 1);
    Product product2 = Product(2, 'Smartphone', 499.99, 2);

    cart.addProduct(product1);
    cart.addProduct(product2);

    cart.applyDiscountCode('SAVE10');

    cart.displayCartSummary();

    cart.removeProduct(product1);
    cart.displayCartSummary();
  } catch (e) {
    print('Error: $e');
  }
}
