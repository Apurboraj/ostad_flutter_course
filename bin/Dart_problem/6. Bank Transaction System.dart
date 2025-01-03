import 'dart:async';

// Base class for a Bank Account
class BankAccount {
  String accountNumber;
  String accountHolderName;
  double balance;

  BankAccount({
    required this.accountNumber,
    required this.accountHolderName,
    required this.balance,
  });

  void deposit(double amount) async {
    if (amount <= 0) {
      print("Deposit amount must be greater than zero.");
      return;
    }
    print("Processing deposit of \$${amount.toStringAsFixed(2)}...");
    await Future.delayed(Duration(seconds: 2)); // Simulate delay
    balance += amount;
    print("Deposit successful! New balance: \$${balance.toStringAsFixed(2)}\n");
  }

  void withdraw(double amount) async {
    if (amount <= 0) {
      print("Withdrawal amount must be greater than zero.");
      return;
    }
    try {
      if (amount > balance) {
        throw Exception("Insufficient balance.");
      }
      print("Processing withdrawal of \$${amount.toStringAsFixed(2)}...");
      await Future.delayed(Duration(seconds: 2)); // Simulate delay
      balance -= amount;
      print("Withdrawal successful! New balance: \$${balance.toStringAsFixed(2)}\n");
    } catch (e) {
      print("Error: ${e.toString()}\n");
    }
  }

  void checkBalance() {
    print("Account Balance: \$${balance.toStringAsFixed(2)}\n");
  }
}

// SavingsAccount subclass with interest calculation
class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount({
    required String accountNumber,
    required String accountHolderName,
    required double balance,
    required this.interestRate,
  }) : super(
      accountNumber: accountNumber,
      accountHolderName: accountHolderName,
      balance: balance);

  void addInterest() {
    double interest = balance * (interestRate / 100);
    balance += interest;
    print("Interest of \$${interest.toStringAsFixed(2)} added. New balance: \$${balance.toStringAsFixed(2)}\n");
  }
}

// CurrentAccount subclass with overdraft limit
class CurrentAccount extends BankAccount {
  double overdraftLimit;

  CurrentAccount({
    required String accountNumber,
    required String accountHolderName,
    required double balance,
    required this.overdraftLimit,
  }) : super(
      accountNumber: accountNumber,
      accountHolderName: accountHolderName,
      balance: balance);

  @override
  void withdraw(double amount) async {
    if (amount <= 0) {
      print("Withdrawal amount must be greater than zero.");
      return;
    }
    try {
      if (amount > balance + overdraftLimit) {
        throw Exception("Exceeded overdraft limit.");
      }
      print("Processing withdrawal of \$${amount.toStringAsFixed(2)}...");
      await Future.delayed(Duration(seconds: 2)); // Simulate delay
      balance -= amount;
      print("Withdrawal successful! New balance: \$${balance.toStringAsFixed(2)}\n");
    } catch (e) {
      print("Error: ${e.toString()}\n");
    }
  }
}

void main() async {
  // Create a Savings Account
  var savings = SavingsAccount(
    accountNumber: "SAV123",
    accountHolderName: "Alice",
    balance: 1000.0,
    interestRate: 5.0,
  );

  savings.checkBalance();
  savings.deposit(500);
  await Future.delayed(Duration(seconds: 3)); // Wait for deposit
  savings.addInterest();

  // Create a Current Account
  var current = CurrentAccount(
    accountNumber: "CUR456",
    accountHolderName: "Bob",
    balance: 200.0,
    overdraftLimit: 300.0,
  );

  current.checkBalance();
  current.withdraw(400);
  await Future.delayed(Duration(seconds: 3)); // Wait for withdrawal
  current.withdraw(200);
}