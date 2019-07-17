import 'entity/task.dart';

abstract class TasksRepository {
  Future<List<Task>> getTasks();
}
