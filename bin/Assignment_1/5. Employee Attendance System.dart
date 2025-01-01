import 'dart:io';
import 'dart:collection';

class Employee {
  final int id;
  final String name;
  final String designation;
  final Map<DateTime, String> attendance;

  Employee({
    required this.id,
    required this.name,
    required this.designation,
  }) : attendance = {};

  double calculateAttendancePercentage() {
    if (attendance.isEmpty) return 0.0;
    final totalDays = attendance.length;
    final presentDays = attendance.values.where((status) => status == 'Present').length;
    return (presentDays / totalDays) * 100;
  }

  @override
  String toString() => '$id: $name ($designation)';
}

class AttendanceSystem {
  final Set<int> _employeeIds = {};
  final List<Employee> _employees = [];

  void addEmployee(Employee employee) {
    try {
      if (_employeeIds.contains(employee.id)) {
        throw Exception('Employee with ID ${employee.id} already exists.');
      }
      _employeeIds.add(employee.id);
      _employees.add(employee);
      print('Employee ${employee.name} added successfully.');
    } catch (e) {
      print('Error: $e');
    }
  }

  void markAttendance(int employeeId, String status) {
    try {
      final employee = _employees.firstWhere((e) => e.id == employeeId);
      final date = DateTime.now();
      employee.attendance[date] = status;
      print('Marked $status for ${employee.name} on ${date.toLocal()}');
    } catch (e) {
      print('Error: $e');
    }
  }

  void viewAttendanceHistory(int employeeId) {
    try {
      final employee = _employees.firstWhere((e) => e.id == employeeId);
      if (employee.attendance.isEmpty) {
        print('No attendance records for ${employee.name}.');
        return;
      }
      print('Attendance history for ${employee.name}:');
      employee.attendance.forEach((date, status) {
        print('${date.toLocal()}: $status');
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void displayAttendancePercentages() {
    if (_employees.isEmpty) {
      print('No employees in the system.');
      return;
    }
    print('Attendance percentages:');
    for (final employee in _employees) {
      final percentage = employee.calculateAttendancePercentage();
      print('${employee.name}: ${percentage.toStringAsFixed(2)}%');
    }
  }
}

void main() {
  final system = AttendanceSystem();

  while (true) {
    print('''\nOptions:
1. Add employee
2. Mark attendance
3. View attendance history
4. Display attendance percentages
5. Exit''');

    stdout.write('Select an option: ');
    final choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        stdout.write('Enter employee ID: ');
        final id = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        stdout.write('Enter employee name: ');
        final name = stdin.readLineSync() ?? '';
        stdout.write('Enter employee designation: ');
        final designation = stdin.readLineSync() ?? '';

        if (id > 0 && name.isNotEmpty && designation.isNotEmpty) {
          system.addEmployee(Employee(id: id, name: name, designation: designation));
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case 2:
        stdout.write('Enter employee ID: ');
        final id = int.tryParse(stdin.readLineSync() ?? '');
        stdout.write('Enter status (Present/Absent): ');
        final status = stdin.readLineSync()?.capitalize() ?? '';

        if (id != null && (status == 'Present' || status == 'Absent')) {
          system.markAttendance(id, status);
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case 3:
        stdout.write('Enter employee ID: ');
        final id = int.tryParse(stdin.readLineSync() ?? '');
        if (id != null) {
          system.viewAttendanceHistory(id);
        } else {
          print('Invalid ID. Please try again.');
        }
        break;

      case 4:
        system.displayAttendancePercentages();
        break;

      case 5:
        print('Exiting the application. Goodbye!');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) return this;
    return this[0].toUpperCase() + this.substring(1).toLowerCase();
  }
}