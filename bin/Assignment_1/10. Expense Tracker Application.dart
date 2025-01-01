import 'dart:async';

class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;
  String category;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });
}

class Tracker {
  List<Transaction> _transactions = [];

  Future<void> addTransaction(Transaction transaction) async {
    // Simulate fetching transaction data from a server
    await Future.delayed(Duration(milliseconds: 500));
    _transactions.add(transaction);
  }

  List<Transaction> getTransactionsByCategory(String category) {
    return _transactions.where((t) => t.category == category).toList();
  }

  double getTotalExpensesForMonth(int year, int month) {
    return _transactions
        .where((t) =>
    t.date.year == year && t.date.month == month)
        .map((t) => t.amount)
        .reduce((value, element) => value + element);
  }

  List<Transaction> getTransactionsByDateRange(
      DateTime startDate, DateTime endDate) {
    return _transactions
        .where((t) => t.date.isAfter(startDate) && t.date.isBefore(endDate))
        .toList();
  }
}

void main() async {
  Tracker tracker = Tracker();

  // Add some sample transactions
  await tracker.addTransaction(Transaction(
      id: '1',
      title: 'Lunch',
      amount: 15.0,
      date: DateTime(2024, 11, 15),
      category: 'Food'));
  await tracker.addTransaction(Transaction(
      id: '2',
      title: 'Bus Fare',
      amount: 5.0,
      date: DateTime(2024, 11, 16),
      category: 'Transport'));
  await tracker.addTransaction(Transaction(
      id: '3',
      title: 'Coffee',
      amount: 3.0,
      date: DateTime(2024, 11, 17),
      category: 'Food'));
  await tracker.addTransaction(Transaction(
      id: '4',
      title: 'Dinner',
      amount: 20.0,
      date: DateTime(2024, 11, 18),
      category: 'Food'));

  // Get transactions by category
  List<Transaction> foodTransactions =
  tracker.getTransactionsByCategory('Food');
  print('Food Transactions:');
  for (var transaction in foodTransactions) {
    print('${transaction.title}: \$${transaction.amount}');
  }

  // Calculate total expenses for November 2024
  double totalExpenses = tracker.getTotalExpensesForMonth(2024, 11);
  print('Total Expenses for November 2024: \$${totalExpenses}');

  // Get transactions by date range
  List<Transaction> transactionsInRange = tracker.getTransactionsByDateRange(
      DateTime(2024, 11, 16), DateTime(2024, 11, 18));
  print('Transactions from 16th to 18th November:');
  for (var transaction in transactionsInRange) {
    print('${transaction.title}: \$${transaction.amount}');
  }
}