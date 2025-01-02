import 'dart:async';

class MenuItem {
  int id;
  String name;
  double price;
  bool isAvailable;

  MenuItem(this.id, this.name, this.price, this.isAvailable);
}

class Order {
  Set<MenuItem> orderedItems = {};

  void addMenuItem(MenuItem item) {
    if (item.isAvailable) {
      orderedItems.add(item);
      print('${item.name} added to the order.');
    } else {
      throw Exception('${item.name} is not available.');
    }
  }

  void removeMenuItem(MenuItem item) {
    if (orderedItems.contains(item)) {
      orderedItems.remove(item);
      print('${item.name} removed from the order.');
    } else {
      throw Exception('${item.name} is not in the order.');
    }
  }

  void displayOrderSummary() {
    double totalPrice = orderedItems.fold(0.0, (sum, item) => sum + item.price);
    print('Order Summary:');
    orderedItems.forEach((item) {
      print('Item: ${item.name}, Price: \$${item.price}');
    });
    print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
  }
}

Future<void> processOrder(Order order) async {
  print('Processing order...');
  await Future.delayed(Duration(seconds: 2)); // Simulate order processing delay
  print('Order processed successfully.');
}

void main() async {
  try {
    MenuItem item1 = MenuItem(1, 'Burger', 5.99, true);
    MenuItem item2 = MenuItem(2, 'Pizza', 8.99, false);
    MenuItem item3 = MenuItem(3, 'Salad', 4.99, true);

    Order order = Order();

    order.addMenuItem(item1);
    order.addMenuItem(item3);

    await processOrder(order);

    order.displayOrderSummary();

    order.removeMenuItem(item1);
    order.displayOrderSummary();
  } catch (e) {
    print('Error: $e');
  }
}
