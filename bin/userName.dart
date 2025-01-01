import 'dart:io';

main(){
  print("Enter Your name: ");
  String? name = stdin.readLineSync();
  print("Enter your age: ");
  dynamic age = int.tryParse(stdin.readLineSync()!);
  print("Welcome to  Dart $name\nYour age is $age");
}
