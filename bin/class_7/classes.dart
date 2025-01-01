main(){
//   Student student_1 = Student();
//   student_1.studentName = 'Apurbo';
//   student_1.age = 18;
//   student_1.studentClass = "Class-12";
//
//   print(student_1.studentName);
//   print(student_1.age);
//   print(student_1.studentClass);
//
//   Student student_2 = Student();
//   student_2.studentName = 'Manik';
//   student_2.age = 19;
//   student_2.studentClass = "Class-11";
//
//   print(student_2.studentName);
//   print(student_2.age);
//   print(student_2.studentClass);

  //Mobile class

  //instance / Object
  Mobile iphoneX = Mobile();

  iphoneX.year= 2020;
  iphoneX.model = "Iphone 10";

  print(iphoneX.model);
  iphoneX.charging();



 }
//
// class Student{
//   late String studentName;
//   late int age;
//   late String studentClass;
// }
class Mobile{
  int ? year;
  String ?model;

  void charging(){
    print("I am charging");
  }
}