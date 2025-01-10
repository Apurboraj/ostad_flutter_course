abstract class Role {
  void displayRole();
}

class StudentRole extends Role {
  @override
  void displayRole() {
    print('Role: Student');
  }
}

class TeacherRole extends Role {
  @override
  void displayRole() {
    print('Role: Teacher');
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

class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores;

  Student(String name, int age, String address, Role role, this.studentID, this.grade, this.courseScores)
      : super(name, age, address, role);

  @override
  void displayRole() {
    print('Role: Student');
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }
    int totalScore = courseScores.reduce((a, b) => a + b);
    return totalScore / courseScores.length;
  }
}

void main() {
  Role studentRole = StudentRole();
  Role teacherRole = TeacherRole();

  Student student = Student('Apurbo', 20, 'Dhaka', studentRole, '1296', 'A', [85, 90, 78, 92]);
  Person teacher = Person('Dipto', 35, 'Manikganj', teacherRole);

  print('Name: ${student.getName}, Age: ${student.getAge}, Address: ${student.getAddress}, Student ID: ${student.studentID}, Grade: ${student.grade}');
  student.displayRole();
  print('Average Score: ${student.calculateAverageScore()}');

  print('Name: ${teacher.getName}, Age: ${teacher.getAge}, Address: ${teacher.getAddress}');
  teacher.displayRole();
}
