import 'dart:io';

main() {
  while (true) {
    // Ask for the first number
    print("Enter first number: ");
    String? aInput = stdin.readLineSync();
    double? a = double.tryParse(aInput ?? '');

    // Validate the input
    if (a == null) {
      print("Invalid input. Please enter a valid number.");
      continue;
    }

    // Ask for the operator
    print("Enter operator (+, -, *, /): ");
    String? op = stdin.readLineSync();

    // Check for valid operator
    if (op != "+" && op != "-" && op != "*" && op != "/") {
      print("Invalid operator. Please enter one of (+, -, *, /).");
      continue;
    }

    // Ask for the second number
    print("Enter second number: ");
    String? bInput = stdin.readLineSync();
    double? b = double.tryParse(bInput ?? '');

    // Validate the input
    if (b == null) {
      print("Invalid input. Please enter a valid number.");
      continue;
    }

    // Perform the calculation
    double result;
    switch (op) {
      case "+":
        result = a + b;
        break;
      case "-":
        result = a - b;
        break;
      case "*":
        result = a * b;
        break;
      case "/":
        if (b == 0) {
          print("Error: Division by zero is not allowed.");
          continue;
        }
        result = a / b;
        break;
      default:
        print("Invalid operator.");
        continue;
    }

    // Display the result
    print("Result: $result");

    // Ask if the user wants to calculate again
    stdout.write("Do you want to calculate again? (y/n): ");
    String? continueInput = stdin.readLineSync();
    if (continueInput?.toLowerCase() != "y") {
      break;
    }
  }
}

