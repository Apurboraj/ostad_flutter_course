import 'dart:collection';

class Task {
  int id;
  String title;
  String description;
  String status;
  DateTime dueDate;

  Task(this.id, this.title, this.description, this.status, this.dueDate);
}

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void updateTaskStatus(int id, String newStatus) {
    Task task = tasks.firstWhere((task) => task.id == id, orElse: () => throw Exception('Task not found'));
    task.status = newStatus;
  }

  List<Task> listTasksByStatus(String status) {
    return tasks.where((task) => task.status == status).toList();
  }

  List<Task> showOverdueTasks() {
    DateTime now = DateTime.now();
    return tasks.where((task) => task.dueDate.isBefore(now) && task.status != 'Completed').toList();
  }
}

void main() {
  try {
    TaskManager manager = TaskManager();

    Task task1 = Task(1, 'Task 1', 'Description 1', 'Pending', DateTime(2025, 1, 1));
    Task task2 = Task(2, 'Task 2', 'Description 2', 'In Progress', DateTime(2025, 1, 2));
    Task task3 = Task(3, 'Task 3', 'Description 3', 'Completed', DateTime(2025, 1, 3));

    manager.addTask(task1);
    manager.addTask(task2);
    manager.addTask(task3);

    manager.updateTaskStatus(1, 'In Progress');

    print('Tasks by Status (In Progress):');
    manager.listTasksByStatus('In Progress').forEach((task) {
      print('ID: ${task.id}, Title: ${task.title}, Status: ${task.status}');
    });

    print('Overdue Tasks:');
    manager.showOverdueTasks().forEach((task) {
      print('ID: ${task.id}, Title: ${task.title}, Due Date: ${task.dueDate}');
    });
  } catch (e) {
    print('Error: $e');
  }
}
