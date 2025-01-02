class Student {
  int id;
  String name;
  Map<String, double> marks;

  Student(this.id, this.name, this.marks);
}

class GradingSystem {
  List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  double calculateAverageMarks(Student student) {
    double totalMarks = student.marks.values.fold(0.0, (sum, mark) => sum + mark);
    return totalMarks / student.marks.length;
  }

  String assignGrade(double averageMarks) {
    if (averageMarks >= 90) {
      return 'A';
    } else if (averageMarks >= 80) {
      return 'B';
    } else if (averageMarks >= 70) {
      return 'C';
    } else if (averageMarks >= 60) {
      return 'D';
    } else {
      return 'F';
    }
  }

  void listStudentsWithGrades() {
    students.sort((a, b) => calculateAverageMarks(b).compareTo(calculateAverageMarks(a)));
    students.forEach((student) {
      double averageMarks = calculateAverageMarks(student);
      String grade = assignGrade(averageMarks);
      print('ID: ${student.id}, Name: ${student.name}, Average Marks: ${averageMarks.toStringAsFixed(2)}, Grade: $grade');
    });
  }
}

void main() {
  try {
    GradingSystem gradingSystem = GradingSystem();

    Student student1 = Student(1, 'Apurbo', {'Math': 95, 'Science': 90, 'English': 85});
    Student student2 = Student(2, 'Apon', {'Math': 75, 'Science': 80, 'English': 70});
    Student student3 = Student(3, 'Avilash', {'Math': 65, 'Science': 60, 'English': 55});

    gradingSystem.addStudent(student1);
    gradingSystem.addStudent(student2);
    gradingSystem.addStudent(student3);

    gradingSystem.listStudentsWithGrades();
  } catch (e) {
    print('Error: $e');
  }
}
