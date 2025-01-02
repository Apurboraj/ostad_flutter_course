import 'dart:collection';

class Employee {
  int id;
  String name;
  String designation;
  Map<DateTime, String> attendance;

  Employee(this.id, this.name, this.designation) : attendance = {} {}

  void markAttendance(DateTime date, String status) {
    attendance[date] = status;
  }

  void viewAttendanceHistory() {
    attendance.forEach((date, status) {
      print('Date: $date, Status: $status');
    });
  }

  double calculateAttendancePercentage() {
    int presentDays = attendance.values.where((status) => status == 'Present').length;
    return (presentDays / attendance.length) * 100;
  }
}

class EmployeeManager {
  Set<int> employeeIds = HashSet<int>();
  List<Employee> employees = [];

  void addEmployee(Employee employee) {
    if (employeeIds.contains(employee.id)) {
      throw Exception('Duplicate employee ID: ${employee.id}');
    } else {
      employeeIds.add(employee.id);
      employees.add(employee);
    }
  }

  Employee getEmployeeById(int id) {
    return employees.firstWhere((employee) => employee.id == id, orElse: () => throw Exception('Employee not found'));
  }
}

void main() {
  try {
    EmployeeManager manager = EmployeeManager();

    Employee emp1 = Employee(1, 'John Doe', 'Developer');
    Employee emp2 = Employee(2, 'Jane Smith', 'Designer');

    manager.addEmployee(emp1);
    manager.addEmployee(emp2);

    emp1.markAttendance(DateTime(2025, 1, 1), 'Present');
    emp1.markAttendance(DateTime(2025, 1, 2), 'Absent');
    emp2.markAttendance(DateTime(2025, 1, 1), 'Present');

    emp1.viewAttendanceHistory();
    print('Attendance Percentage: ${emp1.calculateAttendancePercentage()}%');

    emp2.viewAttendanceHistory();
    print('Attendance Percentage: ${emp2.calculateAttendancePercentage()}%');
  } catch (e) {
    print('Error: $e');
  }
}
