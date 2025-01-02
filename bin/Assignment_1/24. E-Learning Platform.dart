import 'dart:async';

class Course {
  final int id;
  final String title;
  final String description;
  final double price;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });
}

class Student {
  late final String  name;
  Set<Course> _enrolledCourses = {};

  Student(String s);

  void enrollInCourse(Course course) {
    _enrolledCourses.add(course);
  }

  Set<Course> getEnrolledCourses() {
    return _enrolledCourses;
  }

  double calculateTotalCost() {
    double totalCost = 0;
    for (var course in _enrolledCourses) {
      totalCost += course.price;
    }
    return totalCost;
  }

  Future<bool> confirmCoursePurchase(Course course) async {
    // Simulate payment processing and confirmation
    await Future.delayed(Duration(seconds: 2)); // Simulate processing time
    // In a real-world scenario, this would involve interacting with a payment gateway
    print('Processing payment for ${course.title}...');
    // Simulate successful payment
    return true;
  }
}

// Example usage
void main() async {
  // Create sample courses
  Course course1 = Course(
    id: 1,
    title: 'Introduction to Programming',
    description: 'Learn the fundamentals of programming',
    price: 99.99,
  );
  Course course2 = Course(
    id: 2,
    title: 'Data Science with Python',
    description: 'Learn data science using Python',
    price: 149.99,
  );

  // Create a student
  Student student = Student('Alice');

  // Enroll in courses
  student.enrollInCourse(course1);
  student.enrollInCourse(course2);

  // View enrolled courses
  Set<Course> enrolledCourses = student.getEnrolledCourses();
  print('Enrolled Courses:');
  for (var course in enrolledCourses) {
    print('${course.title} - \$${course.price}');
  }

  // Calculate total cost
  double totalCost = student.calculateTotalCost();
  print('Total Cost: \$${totalCost.toStringAsFixed(2)}');

  // Confirm course purchase (simulate)
  bool isPurchased = await student.confirmCoursePurchase(course1);
  if (isPurchased) {
    print('Course purchased successfully!');
  } else {
    print('Course purchase failed.');
  }
}