import 'dart:async';

class Expense {
  final int id;
  final String category;
  final double amount;
  final DateTime date;

  Expense({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
  });
}

class ExpenseManager {
  List<Expense> _expenses = [];
  int _nextExpenseId = 1;

  Future<void> addExpense(String category, double amount) async {
    // Simulate fetching current date (replace with actual date/time library)
    DateTime now = DateTime.now();

    // Create Expense object
    Expense expense = Expense(
      id: _nextExpenseId++,
      category: category,
      amount: amount,
      date: now,
    );

    // Simulate adding expense to database
    await Future.delayed(Duration(milliseconds: 500)); // Simulate database operation
    _expenses.add(expense);
  }

  Map<String, List<Expense>> groupExpensesByCategory() {
    Map<String, List<Expense>> groupedExpenses = {};
    for (var expense in _expenses) {
      if (!groupedExpenses.containsKey(expense.category)) {
        groupedExpenses[expense.category] = [];
      }
      groupedExpenses[expense.category]!.add(expense);
    }
    return groupedExpenses;
  }

  double calculateTotalExpensesForMonth(int year, int month) {
    return _expenses
        .where((expense) =>
    expense.date.year == year && expense.date.month == month)
        .fold<double>(0, (previousValue, element) => previousValue + element.amount);
  }
}

// Example usage
void main() async {
  ExpenseManager expenseManager = ExpenseManager();

  // Add expenses
  await expenseManager.addExpense('Food', 50.0);
  await expenseManager.addExpense('Transportation', 20.0);
  await expenseManager.addExpense('Entertainment', 30.0);
  await expenseManager.addExpense('Food', 40.0);

  // Group expenses by category
  Map<String, List<Expense>> groupedExpenses =
  expenseManager.groupExpensesByCategory();
  print('Expenses by Category:');
  groupedExpenses.forEach((category, expenses) {
    print('$category:');
    for (var expense in expenses) {
      print(' - \$${expense.amount}');
    }
  });

  // Calculate total expenses for the current month
  DateTime now = DateTime.now();
  double totalExpenses =
  expenseManager.calculateTotalExpensesForMonth(now.year, now.month);
  print('Total Expenses for ${now.month}/${now.year}: \$${totalExpenses}');
}