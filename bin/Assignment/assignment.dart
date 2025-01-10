abstract class Role {
  void displayRole();
}

class Person implements Role {
  String name;
  int age;
  String address;
  Role role;

  Person(this.name, this.age, this.address, this.role);

  @override
  void displayRole() {
    role.displayRole();
  }
}

class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores;

  Student(String name, int age, String address, this.studentID, this.grade, this.courseScores)
      : super(name, age, address, StudentRole());

  double calculateAverageScore() {
    int sum = courseScores.reduce((a, b) => a + b);
    return sum / courseScores.length;
  }
}

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address, TeacherRole());

  void displayCoursesTaught() {
    print('Courses Taught:');
    for (var course in coursesTaught) {
      print('- $course');
    }
  }
}

class StudentRole implements Role {
  @override
  void displayRole() {
    print('Role: Student');
  }
}

class TeacherRole implements Role {
  @override
  void displayRole() {
    print('Role: Teacher');
  }
}

void main() {
  // Create instances of Student and Teacher
  Student student = Student('John Doe', 20, '123 Main St', 'S123', 'A', [90, 85, 82]);
  Teacher teacher = Teacher('Mrs. Smith', 35, '456 Oak St', 'T456', ['Math', 'English', 'Bengali']);

  // Display student information
  print('Student Information:');
  student.displayRole();
  print('Name: ${student.name}');
  print('Age: ${student.age}');
  print('Address: ${student.address}');
  print('Average Score: ${student.calculateAverageScore()}');

  // Display teacher information
  print('\nTeacher Information:');
  teacher.displayRole();
  print('Name: ${teacher.name}');
  print('Age: ${teacher.age}');
  print('Address: ${teacher.address}');
  teacher.displayCoursesTaught();
}
