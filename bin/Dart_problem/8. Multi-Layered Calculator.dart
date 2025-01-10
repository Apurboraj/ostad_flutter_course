import 'dart:math';
import 'dart:io';

// Basic Calculator Class
class BasicCalculator {
  double add(double a, double b) => a + b;

  double subtract(double a, double b) => a - b;

  double multiply(double a, double b) => a * b;

  double divide(double a, double b) {
    try {
      if (b == 0) {
        throw Exception("Division by zero is not allowed.");
      }
      return a / b;
    } catch (e) {
      print("Error: ${e.toString()}");
      return double.nan;
    }
  }
}

// Advanced Calculator Class
class AdvancedCalculator extends BasicCalculator {
  double sinFunction(double value) => sin(value);

  double cosFunction(double value) => cos(value);

  double tanFunction(double value) {
    try {
      if (cos(value) == 0) {
        throw Exception("Undefined value for tan at this angle.");
      }
      return tan(value);
    } catch (e) {
      print("Error: ${e.toString()}");
      return double.nan;
    }
  }

  double power(double base, double exponent) => pow(base, exponent).toDouble();

  double squareRoot(double value) {
    try {
      if (value < 0) {
        throw Exception("Square root of a negative number is not allowed.");
      }
      return sqrt(value);
    } catch (e) {
      print("Error: ${e.toString()}");
      return double.nan;
    }
  }
}

void main() {
  var calculator = AdvancedCalculator();

  while (true) {
    print("\nSelect an operation:");
    print("1. Add");
    print("2. Subtract");
    print("3. Multiply");
    print("4. Divide");
    print("5. Sin");
    print("6. Cos");
    print("7. Tan");
    print("8. Power");
    print("9. Square Root");
    print("10. Exit");

    stdout.write("Enter your choice: ");
    int? choice = int.tryParse(stdin.readLineSync()!);

    if (choice == null || choice < 1 || choice > 10) {
      print("Invalid choice. Please try again.");
      continue;
    }

    if (choice == 10) {
      print("Exiting calculator. Goodbye!");
      break;
    }

    double num1 = 0, num2 = 0;

    if (choice >= 1 && choice <= 4 || choice == 8) {
      stdout.write("Enter the first number: ");
      num1 = double.tryParse(stdin.readLineSync()!) ?? 0;
      stdout.write("Enter the second number: ");
      num2 = double.tryParse(stdin.readLineSync()!) ?? 0;
    } else if (choice == 5 || choice == 6 || choice == 7 || choice == 9) {
      stdout.write("Enter the number: ");
      num1 = double.tryParse(stdin.readLineSync()!) ?? 0;
    }

    switch (choice) {
      case 1:
        print("Result: ${calculator.add(num1, num2)}");
        break;
      case 2:
        print("Result: ${calculator.subtract(num1, num2)}");
        break;
      case 3:
        print("Result: ${calculator.multiply(num1, num2)}");
        break;
      case 4:
        print("Result: ${calculator.divide(num1, num2)}");
        break;
      case 5:
        print("Result: ${calculator.sinFunction(num1)}");
        break;
      case 6:
        print("Result: ${calculator.cosFunction(num1)}");
        break;
      case 7:
        print("Result: ${calculator.tanFunction(num1)}");
        break;
      case 8:
        print("Result: ${calculator.power(num1, num2)}");
        break;
      case 9:
        print("Result: ${calculator.squareRoot(num1)}");
        break;
      default:
        print("Invalid operation.");
    }
  }
}