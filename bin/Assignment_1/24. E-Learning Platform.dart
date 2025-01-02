import 'dart:async';

class Course {
  int id;
  String title;
  String description;
  double price;

  Course(this.id, this.title, this.description, this.price);
}

class Student {
  int id;
  String name;
  Set<Course> enrolledCourses = {};

  Student(this.id, this.name);

  void enrollInCourse(Course course) {
    enrolledCourses.add(course);
    print('Enrolled in course: ${course.title}');
  }

  void viewEnrolledCourses() {
    print('Enrolled Courses:');
    enrolledCourses.forEach((course) {
      print('Course ID: ${course.id}, Title: ${course.title}, Price: \$${course.price}');
    });
  }

  double calculateTotalCost() {
    return enrolledCourses.fold(0.0, (sum, course) => sum + course.price);
  }
}

Future<void> confirmCoursePurchase() async {
  print('Confirming course purchase...');
  await Future.delayed(Duration(seconds: 2)); // Simulate purchase confirmation
  print('Course purchase confirmed.');
}

void main() async {
  try {
    Course course1 = Course(1, 'Dart Programming', 'Learn the basics of Dart.', 99.99);
    Course course2 = Course(2, 'Flutter Development', 'Build beautiful mobile apps with Flutter.', 199.99);

    Student student = Student(1, 'Alice');

    student.enrollInCourse(course1);
    student.enrollInCourse(course2);

    await confirmCoursePurchase();

    student.viewEnrolledCourses();
    print('Total Cost: \$${student.calculateTotalCost().toStringAsFixed(2)}');
  } catch (e) {
    print('Error: $e');
  }
}
