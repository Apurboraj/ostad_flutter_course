import 'dart:async';

class Expense {
  int id;
  String category;
  double amount;
  DateTime date;

  Expense(this.id, this.category, this.amount, this.date);
}

class ExpenseManager {
  List<Expense> expenses = [];
  Map<String, List<Expense>> expensesByCategory = {};

  void addExpense(Expense expense) {
    expenses.add(expense);
    if (!expensesByCategory.containsKey(expense.category)) {
      expensesByCategory[expense.category] = [];
    }
    expensesByCategory[expense.category]!.add(expense);
    print('Expense added: ${expense.category}, \$${expense.amount}, ${expense.date}');
  }

  void groupExpensesByCategory() {
    expensesByCategory.forEach((category, expenses) {
      print('Category: $category');
      expenses.forEach((expense) {
        print('ID: ${expense.id}, Amount: \$${expense.amount}, Date: ${expense.date}');
      });
    });
  }

  double calculateTotalExpensesForMonth(int year, int month) {
    return expenses
        .where((expense) => expense.date.year == year && expense.date.month == month)
        .fold(0.0, (sum, expense) => sum + expense.amount);
  }

  Future<void> fetchExpensesFromDatabase() async {
    print('Fetching expenses from database...');
    await Future.delayed(Duration(seconds: 2)); // Simulate fetching data
    print('Expenses fetched from database.');
  }
}

void main() async {
  try {
    ExpenseManager expenseManager = ExpenseManager();

    Expense expense1 = Expense(1, 'Food', 50.0, DateTime(2025, 1, 1));
    Expense expense2 = Expense(2, 'Transport', 20.0, DateTime(2025, 1, 2));
    Expense expense3 = Expense(3, 'Entertainment', 100.0, DateTime(2025, 1, 3));

    expenseManager.addExpense(expense1);
    expenseManager.addExpense(expense2);
    expenseManager.addExpense(expense3);

    await expenseManager.fetchExpensesFromDatabase();

    print('Expenses grouped by category:');
    expenseManager.groupExpensesByCategory();

    print('Total expenses for January 2025: \$${expenseManager.calculateTotalExpensesForMonth(2025, 1).toStringAsFixed(2)}');
  } catch (e) {
    print('Error: $e');
  }
}
