import '../entity/task.dart';

abstract class TasksDataSource {
  Future<List<Task>> getTasks();
  Future<Task> getTask(int id);
  Future<Task> saveTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> completeTask(Task task);
  Future<void> deleteTask(Task task);
  Future<void> deleteAllTasks();
}
