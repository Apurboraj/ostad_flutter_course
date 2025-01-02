import 'dart:async';

class Task {
  int id;
  String description;
  bool isCompleted;

  Task(this.id, this.description, this.isCompleted);
}

class ToDoList {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
    print('Task "${task.description}" added.');
  }

  void markTaskAsCompleted(int id) {
    Task task = tasks.firstWhere((task) => task.id == id, orElse: () => throw Exception('Task not found'));
    task.isCompleted = true;
    print('Task "${task.description}" marked as completed.');
  }

  void listPendingTasks() {
    tasks.where((task) => !task.isCompleted).forEach((task) {
      print('ID: ${task.id}, Description: ${task.description}');
    });
  }

  void deleteTask(int id) {
    Task task = tasks.firstWhere((task) => task.id == id, orElse: () => throw Exception('Task not found'));
    tasks.remove(task);
    print('Task "${task.description}" deleted.');
  }

  Future<void> saveTasksToFile() async {
    print('Saving tasks to file...');
    await Future.delayed(Duration(seconds: 2)); // Simulate saving to file
    print('Tasks saved to file.');
  }
}

void main() async {
  try {
    ToDoList toDoList = ToDoList();

    Task task1 = Task(1, 'Buy groceries', false);
    Task task2 = Task(2, 'Go to the gym', false);
    Task task3 = Task(3, 'Complete assignment', false);

    toDoList.addTask(task1);
    toDoList.addTask(task2);
    toDoList.addTask(task3);

    toDoList.markTaskAsCompleted(2);

    print('Pending Tasks:');
    toDoList.listPendingTasks();

    toDoList.deleteTask(1);

    await toDoList.saveTasksToFile();
  } catch (e) {
    print('Error: $e');
  }
}
