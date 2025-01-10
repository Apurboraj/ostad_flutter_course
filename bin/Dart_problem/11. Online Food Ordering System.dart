import 'dart:async';

class AMenuItem {
  final int id;
  final String name;
  final double price;
  bool isAvailable;

  AMenuItem({
    required this.id,
    required this.name,
    required this.price,
    this.isAvailable = true,
  });
}

class Order {
  final Set<AMenuItem> _orderedItems = {};

  void addItem(AMenuItem item) {
    try {
      if (item.isAvailable) {
        _orderedItems.add(item);
      } else {
        throw Exception('Item ${item.name} is not available.');
      }
    } catch (e) {
      print('Error adding item: $e');
    }
  }

  void removeItem(AMenuItem item) {
    _orderedItems.remove(item);
  }

  void displayOrderSummary() {
    print('Order Summary:');
    double totalPrice = 0;
    for (var item in _orderedItems) {
      print('${item.name} - \$${item.price.toStringAsFixed(2)}');
      totalPrice += item.price;
    }
    print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
  }

  Future<void> processOrder() async {
    print('Processing order...');
    await Future.delayed(Duration(seconds: 2)); // Simulate order processing
    print('Order processed successfully!');
  }
}

// Example usage
void main() {
  // Create sample menu items
  AMenuItem burger = AMenuItem(id: 1, name: 'Burger', price: 10.0);
  AMenuItem fries = AMenuItem(id: 2, name: 'Fries', price: 3.0);
  AMenuItem soda = AMenuItem(id: 3, name: 'Soda', price: 2.0);
  AMenuItem unavailableItem = AMenuItem(
      id: 4, name: 'Special', price: 5.0, isAvailable: false);

  // Create an order
  Order order = Order();

  // Add items to the order
  order.addItem(burger);
  order.addItem(fries);
  order.addItem(soda);

  // Attempt to add an unavailable item
  order.addItem(unavailableItem);

  // Remove an item from the order
  order.removeItem(fries);

  // Display order summary
  order.displayOrderSummary();

  // Process the order
  order.processOrder();
}