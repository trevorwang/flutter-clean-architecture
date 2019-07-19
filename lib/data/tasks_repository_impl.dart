import 'package:flutter_todo/data/entity/task.dart';
import 'package:flutter_todo/data/source/remote/remote_data_source.dart';

import 'tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  RemoteDataSource remote;
  TasksRepositoryImpl(this.remote);
  @override
  Future<List<Task>> getTasks() {
    return Future.delayed(Duration(seconds: 5), () => remote.getTasks());
  }

  @override
  Future<Task> saveTask(Task task) {
    return remote.saveTask(task);
  }
}
