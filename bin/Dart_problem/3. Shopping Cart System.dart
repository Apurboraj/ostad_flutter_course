import 'dart:async';

class Product {
  int id;
  String name;
  double price;
  int stockQuantity;

  Product(this.id, this.name, this.price, this.stockQuantity);

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, stockQuantity: $stockQuantity}';
  }
}

class ShoppingCart {
  Map<Product, int> items = {};

  void addProduct(Product product, int quantity) {
    if (product.stockQuantity < quantity) {
      throw Exception('Not enough stock for ${product.name}');
    }
    if (items.containsKey(product)) {
      items[product] = items[product]! + quantity;
    } else {
      items[product] = quantity;
    }
  }

  void removeProduct(Product product, int quantity) {
    if (!items.containsKey(product)) {
      throw Exception('${product.name} is not in the cart');
    }
    if (items[product]! < quantity) {
      throw Exception('Cannot remove more than what is in the cart');
    }
    items[product] = items[product]! - quantity;
    if (items[product] == 0) {
      items.remove(product);
    }
  }

  double calculateTotal() {
    double total = 0;
    items.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }

  Future<void> checkout() async {
    print('Checking out...');
    await Future.delayed(Duration(seconds: 2)); // Simulate processing time

    items.forEach((product, quantity) {
      product.stockQuantity -= quantity;
      print('Updated stock for ${product.name}: ${product.stockQuantity}');
    });
    items.clear();
    print('Checkout complete.');
  }

  @override
  String toString() {
    if (items.isEmpty) {
      return "Cart is empty";
    }
    String cartContent = "Cart Contents:\n";
    items.forEach((product, quantity) {
      cartContent += "${product.name} x $quantity\n";
    });
    return cartContent;
  }
}

void main() async {
  Product product1 = Product(1, 'Laptop', 1200.0, 10);
  Product product2 = Product(2, 'Mouse', 25.0, 50);
  Product product3 = Product(3, 'Keyboard', 75.0, 20);

  ShoppingCart cart = ShoppingCart();

  try {
    cart.addProduct(product1, 2);
    cart.addProduct(product2, 5);
    cart.addProduct(product3, 1);
    print(cart);
    print('Total: \$${cart.calculateTotal()}');

    cart.removeProduct(product2, 2);
    print(cart);
    print('Total: \$${cart.calculateTotal()}');

    await cart.checkout();
    print(cart);

    cart.addProduct(product1, 15); // This will throw an exception
  } catch (e) {
    print('Error: $e');
  }

  try {
    cart.addProduct(product1, 5);
    print(cart);
  } catch (e) {
    print('Error : $e');
  }
}