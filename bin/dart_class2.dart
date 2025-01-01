//import 'dart:io';
void main() {
  // String str ="i love\n you";
  // print(str);

  // int x=10;
  // int y=30;
  // var rslt=x/y;
  // print(rslt);

  // stdout.write("enter your name: ");
  // String? name = stdin.readLineSync()!;
  // stdout.write("enter your age: ");
  // var age = int.tryParse(stdin.readLineSync()!);
  // print("welcome to dart: $name\nthe age is: $age");

  // stdout.write("enter first number: ");
  // var num1 = double.parse(stdin.readLineSync()!);

  // stdout.write("enter second number: ");
  // var num2 = double.parse(stdin.readLineSync()!);

  // print("the sum is ${(num1/num2).toStringAsFixed(2)}");

  List <int> arr=[10,20,30,60];
  print(arr);
  arr.add(45);
  print(arr);
  arr.addAll([1,2,3]);
  print(arr);
  arr.insert(1, 0);
  print(arr);
  arr.insertAll(0, [4,5,6]);
  print(arr);

  print("print number index wise: ${arr[1]}");

  arr[0]=345;
  print(arr);
  arr.sort();
  print(arr);
  arr.remove(345);
  print(arr);
  arr.removeAt(3);
  print(arr);
  arr.removeLast();
  print(arr);

  print("list length: ${arr.length}");


}