import 'dart:async';

class BankAccount {
  int accountNumber;
  String accountHolderName;
  double balance;

  BankAccount(this.accountNumber, this.accountHolderName, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposit successful. New balance: \$${balance.toStringAsFixed(2)}');
  }

  void withdraw(double amount) {
    if (amount > balance) {
      throw Exception('Insufficient balance');
    } else {
      balance -= amount;
      print('Withdrawal successful. New balance: \$${balance.toStringAsFixed(2)}');
    }
  }

  void checkBalance() {
    print('Current balance: \$${balance.toStringAsFixed(2)}');
  }
}

class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(int accountNumber, String accountHolderName, double balance, this.interestRate)
      : super(accountNumber, accountHolderName, balance);

  void addInterest() {
    double interest = balance * interestRate / 100;
    balance += interest;
    print('Interest added. New balance: \$${balance.toStringAsFixed(2)}');
  }
}

class CurrentAccount extends BankAccount {
  double overdraftLimit;

  CurrentAccount(int accountNumber, String accountHolderName, double balance, this.overdraftLimit)
      : super(accountNumber, accountHolderName, balance);

  @override
  void withdraw(double amount) {
    if (amount > balance + overdraftLimit) {
      throw Exception('Overdraft limit exceeded');
    } else {
      balance -= amount;
      print('Withdrawal successful. New balance: \$${balance.toStringAsFixed(2)}');
    }
  }
}

Future<void> simulateTransaction(BankAccount account, double amount, bool isDeposit) async {
  print('Processing transaction...');
  await Future.delayed(Duration(seconds: 2)); // Simulate real-time transaction delay
  if (isDeposit) {
    account.deposit(amount);
  } else {
    account.withdraw(amount);
  }
}

void main() {
  try {
    SavingsAccount savings = SavingsAccount(12345, 'John Doe', 1000.0, 5.0);
    CurrentAccount current = CurrentAccount(67890, 'Jane Smith', 500.0, 200.0);

    savings.checkBalance();
    current.checkBalance();

    simulateTransaction(savings, 200.0, true);
    simulateTransaction(current, 100.0, false);

    savings.addInterest();
    savings.checkBalance();
    current.checkBalance();
  } catch (e) {
    print('Error: $e');
  }
}