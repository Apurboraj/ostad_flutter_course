class Account {
  int id;
  String name;
  double balance;

  Account(this.id, this.name, this.balance);
}

class Bank {
  Map<int, Account> accounts = {};

  void createAccount(Account account) {
    if (accounts.containsKey(account.id)) {
      throw Exception('Account with ID ${account.id} already exists.');
    } else {
      accounts[account.id] = account;
      print('Account for ${account.name} created.');
    }
  }

  void deposit(int id, double amount) {
    if (accounts.containsKey(id)) {
      accounts[id]!.balance += amount;
      print('Deposited \$${amount.toStringAsFixed(2)} to account ID $id.');
    } else {
      throw Exception('Account with ID $id not found.');
    }
  }

  void withdraw(int id, double amount) {
    if (accounts.containsKey(id)) {
      if (accounts[id]!.balance >= amount) {
        accounts[id]!.balance -= amount;
        print('Withdrew \$${amount.toStringAsFixed(2)} from account ID $id.');
      } else {
        throw Exception('Insufficient balance in account ID $id.');
      }
    } else {
      throw Exception('Account with ID $id not found.');
    }
  }

  void transfer(int fromId, int toId, double amount) {
    if (accounts.containsKey(fromId) && accounts.containsKey(toId)) {
      if (accounts[fromId]!.balance >= amount) {
        accounts[fromId]!.balance -= amount;
        accounts[toId]!.balance += amount;
        print('Transferred \$${amount.toStringAsFixed(2)} from account ID $fromId to account ID $toId.');
      } else {
        throw Exception('Insufficient balance in account ID $fromId.');
      }
    } else {
      throw Exception('Invalid account ID(s) provided.');
    }
  }
}

void main() {
  try {
    Bank bank = Bank();

    Account account1 = Account(1, 'Apurbo', 1000.0);
    Account account2 = Account(2, 'Manik', 500.0);

    bank.createAccount(account1);
    bank.createAccount(account2);

    bank.deposit(1, 200.0);
    bank.withdraw(2, 100.0);
    bank.transfer(1, 2, 300.0);

    print('Account 1 Balance: \$${account1.balance.toStringAsFixed(2)}');
    print('Account 2 Balance: \$${account2.balance.toStringAsFixed(2)}');
  } catch (e) {
    print('Error: $e');
  }
}
