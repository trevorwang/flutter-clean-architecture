import 'package:flutter_todo/data/entity/task.dart';
import 'package:flutter_todo/data/tasks_repository.dart';

import 'data.dart';

class FakeTaskRepository implements TasksRepository {
  @override
  Future<List<Task>> getTasks() {
    return Future.value(taskList.map((i) => Task.fromJson(i)).toList());
  }

  @override
  Future<Task> saveTask(Task task) {
    return Future.value(Task.fromJson(taskDetail));
  }
}

class EmptyTaskRepository extends FakeTaskRepository {
  @override
  Future<List<Task>> getTasks() {
    return Future.value([]);
  }
}

class DelayedTaskRepository extends FakeTaskRepository {
  @override
  Future<List<Task>> getTasks() {
    return Future.delayed(Duration(seconds: 2), () => []);
  }
}
