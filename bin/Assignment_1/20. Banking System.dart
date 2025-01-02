class Account {
  final int id;
  final String name;
  double balance;

  Account({
    required this.id,
    required this.name,
    this.balance = 0.0,
  });
}

class Bank {
  Map<int, Account> _accounts = {};
  int _nextAccountId = 1;

  Account createAccount(String name) {
    Account account = Account(id: _nextAccountId++, name: name);
    _accounts[account.id] = account;
    return account;
  }

  void deposit(int accountId, double amount) {
    try {
      if (_accounts.containsKey(accountId)) {
        _accounts[accountId]!.balance += amount;
      } else {
        throw Exception('Account with ID $accountId not found.');
      }
    } catch (e) {
      print('Error depositing: $e');
    }
  }

  void withdraw(int accountId, double amount) {
    try {
      if (_accounts.containsKey(accountId)) {
        if (_accounts[accountId]!.balance >= amount) {
          _accounts[accountId]!.balance -= amount;
        } else {
          throw Exception('Insufficient balance.');
        }
      } else {
        throw Exception('Account with ID $accountId not found.');
      }
    } catch (e) {
      print('Error withdrawing: $e');
    }
  }

  void transfer(int fromAccountId, int toAccountId, double amount) {
    try {
      if (_accounts.containsKey(fromAccountId) &&
          _accounts.containsKey(toAccountId)) {
        if (_accounts[fromAccountId]!.balance >= amount) {
          _accounts[fromAccountId]!.balance -= amount;
          _accounts[toAccountId]!.balance += amount;
        } else {
          throw Exception('Insufficient balance.');
        }
      } else {
        throw Exception('Invalid account IDs.');
      }
    } catch (e) {
      print('Error transferring: $e');
    }
  }
}

// Example usage
void main() {
  Bank bank = Bank();

  // Create accounts
  Account account1 = bank.createAccount('Alice');
  Account account2 = bank.createAccount('Bob');

  // Deposit money
  bank.deposit(account1.id, 1000.0);
  bank.deposit(account2.id, 500.0);

  // Withdraw money
  bank.withdraw(account1.id, 200.0);

  // Transfer money
  bank.transfer(account1.id, account2.id, 300.0);

  // Print account balances
  print('${account1.name} balance: \$${account1.balance}');
  print('${account2.name} balance: \$${account2.balance}');
}