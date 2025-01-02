// Define the Task class
class Task {
  final int id;
  final String description;
  bool isCompleted;

  Task({required this.id, required this.description, this.isCompleted = false});

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() => 'Task(ID: $id, Description: "$description", Completed: $isCompleted)';
}

// Define the ToDoList class
class ToDoList {
  final List<Task> _tasks = [];

  void addTask(String description) {
    final id = _tasks.length + 1;
    _tasks.add(Task(id: id, description: description));
    print('Task added: "$description"');
  }

  void markTaskAsCompleted(int taskId) {
    try {
      final task = _getTask(taskId);
      if (!task.isCompleted) {
        task.toggleCompletion();
        print('Task $taskId marked as completed.');
      } else {
        print('Task $taskId is already completed.');
      }
    } catch (e) {
      print(e);
    }
  }

  void listPendingTasks() {
    final pendingTasks = _tasks.where((task) => !task.isCompleted).toList();
    if (pendingTasks.isEmpty) {
      print('No pending tasks.');
    } else {
      print('Pending Tasks:');
      for (var task in pendingTasks) {
        print('- $task');
      }
    }
  }

  void deleteTask(int taskId) {
    try {
      final task = _getTask(taskId);
      _tasks.remove(task);
      print('Task $taskId deleted.');
    } catch (e) {
      print(e);
    }
  }

  Future<void> saveTasksToFile() async {
    print('Saving tasks to file...');
    await Future.delayed(Duration(seconds: 2)); // Simulate file saving delay
    print('Tasks saved successfully!');
  }

  Task _getTask(int taskId) {
    final task = _tasks.firstWhere(
          (task) => task.id == taskId,
      orElse: () => throw Exception('Task with ID $taskId not found.'),
    );
    return task;
  }
}

void main() async {
  final toDoList = ToDoList();

  // Add tasks
  toDoList.addTask('Buy groceries');
  toDoList.addTask('Walk the dog');

  // List pending tasks
  toDoList.listPendingTasks();

  // Mark a task as completed
  toDoList.markTaskAsCompleted(1);

  // List pending tasks again
  toDoList.listPendingTasks();

  // Delete a task
  toDoList.deleteTask(2);

  // Save tasks to a file
  await toDoList.saveTasksToFile();
}
