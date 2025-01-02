import 'dart:async';

class Transaction {
  int id;
  String title;
  double amount;
  DateTime date;
  String category;

  Transaction(this.id, this.title, this.amount, this.date, this.category);
}

class Tracker {
  List<Transaction> transactions = [];

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  void displayTransactionsByCategory(String category) {
    transactions.where((transaction) => transaction.category == category).forEach((transaction) {
      print('ID: ${transaction.id}, Title: ${transaction.title}, Amount: \$${transaction.amount}, Date: ${transaction.date}');
    });
  }

  double calculateTotalExpensesForMonth(int year, int month) {
    return transactions
        .where((transaction) => transaction.date.year == year && transaction.date.month == month)
        .fold(0.0, (sum, transaction) => sum + transaction.amount);
  }
}

Future<void> fetchHistoricalData() async {
  print('Fetching historical transaction data...');
  await Future.delayed(Duration(seconds: 2)); // Simulate fetching data
  print('Historical transaction data fetched.');
}

void main() async {
  try {
    Tracker tracker = Tracker();

    Transaction t1 = Transaction(1, 'Groceries', 50.0, DateTime(2025, 1, 1), 'Food');
    Transaction t2 = Transaction(2, 'Bus Ticket', 2.5, DateTime(2025, 1, 2), 'Transport');
    Transaction t3 = Transaction(3, 'Dinner', 30.0, DateTime(2025, 1, 3), 'Food');

    tracker.addTransaction(t1);
    tracker.addTransaction(t2);
    tracker.addTransaction(t3);

    await fetchHistoricalData();

    print('Transactions by Category (Food):');
    tracker.displayTransactionsByCategory('Food');

    print('Total Expenses for January 2025: \$${tracker.calculateTotalExpensesForMonth(2025, 1)}');
  } catch (e) {
    print('Error: $e');
  }
}
