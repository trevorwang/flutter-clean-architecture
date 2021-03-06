import 'package:flutter_todo/data/entity/task.dart';
import 'package:flutter_todo/data/source/remote/task_api.dart';
import 'package:flutter_todo/data/source/tasks_data_source.dart';

class RemoteDataSource implements TasksDataSource {
  final TaskApi _api;
  RemoteDataSource(this._api);
  @override
  Future<void> completeTask(Task task) {
    // TODO: implement completeTask
    return null;
  }

  @override
  Future<void> deleteAllTasks() {
    // TODO: implement deleteAllTasks
    return null;
  }

  @override
  Future<void> deleteTask(Task task) {
    // TODO: implement deleteTask
    return null;
  }

  @override
  Future<Task> getTask(String id) {
    return _api.getTask(id);
  }

  @override
  Future<List<Task>> getTasks() {
    return _api.getTasks();
  }

  @override
  Future<Task> saveTask(Task task) {
    return _api.saveTask(task);
  }

  @override
  Future<void> updateTask(Task task) {
    return _api.updateTask(task.id, task);
  }
}
