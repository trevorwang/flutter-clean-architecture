import 'entity/task.dart';

abstract class TasksRepository {
  Future<List<Task>> getTasks();
  Future<Task> saveTask(Task task);
  Future<Task> updateTask(Task task);
}
