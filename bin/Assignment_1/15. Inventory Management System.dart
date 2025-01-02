class Product {
  int id;
  String name;
  int quantity;
  double price;

  Product(this.id, this.name, this.quantity, this.price);
}

class Inventory {
  Map<int, Product> products = {};

  void addProduct(Product product) {
    if (products.containsKey(product.id)) {
      throw Exception('Product with ID ${product.id} already exists.');
    } else {
      products[product.id] = product;
      print('Product "${product.name}" added to inventory.');
    }
  }

  void updateProductQuantity(int id, int quantity) {
    if (products.containsKey(id)) {
      products[id]!.quantity = quantity;
      print('Product quantity updated for ID $id.');
    } else {
      throw Exception('Product with ID $id not found.');
    }
  }

  double calculateTotalValue() {
    return products.values.fold(0.0, (sum, product) => sum + (product.price * product.quantity));
  }
}

void main() {
  try {
    Inventory inventory = Inventory();

    Product product1 = Product(1, 'Laptop', 10, 999.99);
    Product product2 = Product(2, 'Smartphone', 20, 499.99);

    inventory.addProduct(product1);
    inventory.addProduct(product2);

    inventory.updateProductQuantity(1, 15);

    print('Total Inventory Value: \$${inventory.calculateTotalValue().toStringAsFixed(2)}');
  } catch (e) {
    print('Error: $e');
  }
}
