abstract class Role {
  void displayRole();
}

class Student extends Role {
  @override
  void displayRole() {
    print('I am a Student.');
  }
}

class Teacher extends Role {
  @override
  void displayRole() {
    print('I am a Teacher.');
  }
}

class Person {
  String name;
  int age;
  String address;
  Role role;

  Person(this.name, this.age, this.address, this.role);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  void displayRole() {
    role.displayRole();
  }
}

void main() {
  Role studentRole = Student();
  Role teacherRole = Teacher();

  Person student = Person('Apurbo', 22, 'Dhaka', studentRole);
  Person teacher = Person('Dipto', 35, 'Manikganj', teacherRole);

  print('Name: ${student.getName}, Age: ${student.getAge}, Address: ${student.getAddress}');
  student.displayRole();

  print('Name: ${teacher.getName}, Age: ${teacher.getAge}, Address: ${teacher.getAddress}');
  teacher.displayRole();
}
