// Define the Student class
class Student {
  final int id;
  final String name;
  final Map<String, double> marks; // Map of subjects to scores

  Student({required this.id, required this.name, required this.marks});

  double calculateAverage() {
    if (marks.isEmpty) return 0.0;
    final total = marks.values.reduce((a, b) => a + b);
    return total / marks.length;
  }

  String assignGrade() {
    final average = calculateAverage();
    if (average >= 90) {
      return 'A';
    } else if (average >= 80) {
      return 'B';
    } else if (average >= 70) {
      return 'C';
    } else if (average >= 60) {
      return 'D';
    } else {
      return 'F';
    }
  }

  @override
  String toString() {
    final average = calculateAverage();
    final grade = assignGrade();
    return '$name (ID: $id) - Average: ${average.toStringAsFixed(2)}, Grade: $grade';
  }
}

// Define the GradingSystem class
class GradingSystem {
  final List<Student> _students = [];

  void addStudent(Student student) {
    try {
      for (var score in student.marks.values) {
        if (score < 0 || score > 100) {
          throw Exception('Invalid marks for student ${student.name}: $score');
        }
      }
      _students.add(student);
      print('Added student: ${student.name}');
    } catch (e) {
      print(e);
    }
  }

  void listStudentsWithGrades() {
    if (_students.isEmpty) {
      print('No students available.');
      return;
    }
    print('Students and Grades (Descending Order):');
    final sortedStudents = _students..sort((a, b) => b.calculateAverage().compareTo(a.calculateAverage()));
    for (var student in sortedStudents) {
      print(student);
    }
  }
}

void main() {
  final gradingSystem = GradingSystem();

  // Adding students
  gradingSystem.addStudent(Student(
    id: 1,
    name: 'Alice',
    marks: {'Math': 95, 'Science': 88, 'English': 92},
  ));
  gradingSystem.addStudent(Student(
    id: 2,
    name: 'Bob',
    marks: {'Math': 78, 'Science': 84, 'English': 73},
  ));
  gradingSystem.addStudent(Student(
    id: 3,
    name: 'Charlie',
    marks: {'Math': 60, 'Science': 55, 'English': 58},
  ));
  gradingSystem.addStudent(Student(
    id: 4,
    name: 'Invalid Marks',
    marks: {'Math': 110, 'Science': 50},
  )); // Invalid marks example

  // List students with grades
  gradingSystem.listStudentsWithGrades();
}
