import 'dart:io';
main() {
  // take base of the triangle from user
  stdout.write('Enter the base of the triangle: ');
  double base = double.parse(stdin.readLineSync()!);

  // take height of the triangle from user
  stdout.write('Enter the height of the triangle: ');
  double height = double.parse(stdin.readLineSync()!);

  // Calculate the area of the triangle
  double area = 0.5*base*height;

  // Print the area of the triangle
  print('The area of the triangle is: $area');
}