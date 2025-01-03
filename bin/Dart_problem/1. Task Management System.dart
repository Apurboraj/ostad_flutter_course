import 'dart:collection';
import 'dart:core';

// Enum for task status
enum TaskStatus { pending, inProgress, completed }

// Task class
class Task {
  final int id;
  String title;
  String description;
  TaskStatus status;
  DateTime dueDate;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.dueDate,
  });

  @override
  String toString() {
    return 'Task{id: $id, title: "$title", description: "$description", status: ${status.name}, dueDate: $dueDate}';
  }
}

// TaskManager class
class TaskManager {
  final List<Task> _tasks = [];

  // Add a new task
  void addTask(Task task) {
    _tasks.add(task);
    print('Task added: ${task.title}');
  }

  // Update task status
  void updateTaskStatus(int taskId, TaskStatus newStatus) {
    try {
      final task = _tasks.firstWhere((task) => task.id == taskId);
      task.status = newStatus;
      print('Task updated: ${task.title} is now ${task.status.name}');
    } catch (e) {
      print('Error: Task with id $taskId not found.');
    }
  }

  // List tasks grouped by status
  Map<TaskStatus, List<Task>> listTasksByStatus() {
    final Map<TaskStatus, List<Task>> groupedTasks = {
      TaskStatus.pending: [],
      TaskStatus.inProgress: [],
      TaskStatus.completed: [],
    };
    for (var task in _tasks) {
      groupedTasks[task.status]?.add(task);
    }
    return groupedTasks;
  }

  // Show overdue tasks
  List<Task> getOverdueTasks() {
    final now = DateTime.now();
    return _tasks.where((task) => task.dueDate.isBefore(now) && task.status != TaskStatus.completed).toList();
  }

  // Print tasks grouped by status
  void printTasksByStatus() {
    final groupedTasks = listTasksByStatus();
    groupedTasks.forEach((status, tasks) {
      print('\n${status.name.toUpperCase()} Tasks:');
      tasks.forEach((task) => print(task));
    });
  }

  // Print overdue tasks
  void printOverdueTasks() {
    final overdueTasks = getOverdueTasks();
    print('\nOVERDUE Tasks:');
    if (overdueTasks.isEmpty) {
      print('No overdue tasks.');
    } else {
      overdueTasks.forEach((task) => print(task));
    }
  }
}

void main() {
  final taskManager = TaskManager();

  // Adding tasks
  taskManager.addTask(Task(
    id: 1,
    title: 'Task 1',
    description: 'Description for task 1',
    status: TaskStatus.pending,
    dueDate: DateTime.now().add(Duration(days: 1)),
  ));

  taskManager.addTask(Task(
    id: 2,
    title: 'Task 2',
    description: 'Description for task 2',
    status: TaskStatus.inProgress,
    dueDate: DateTime.now().subtract(Duration(days: 1)),
  ));

  taskManager.addTask(Task(
    id: 3,
    title: 'Task 3',
    description: 'Description for task 3',
    status: TaskStatus.completed,
    dueDate: DateTime.now().subtract(Duration(days: 2)),
  ));

  // Updating task status
  taskManager.updateTaskStatus(1, TaskStatus.inProgress);

  // Listing tasks grouped by status
  taskManager.printTasksByStatus();

  // Showing overdue tasks
  taskManager.printOverdueTasks();
}
