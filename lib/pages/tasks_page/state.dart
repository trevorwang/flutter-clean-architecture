import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_todo/data/entity/task.dart';

class TasksState implements Cloneable<TasksState> {
  List<Task> tasks;
  bool loading;
  TasksState({this.tasks = const [], this.loading = true});
  @override
  TasksState clone() {
    return TasksState(tasks: this.tasks, loading: this.loading);
  }
}

TasksState initState(Map<String, dynamic> args) {
  return TasksState();
}
