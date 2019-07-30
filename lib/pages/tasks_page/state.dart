import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_todo/data/entity/task.dart';

class TasksState implements Cloneable<TasksState> {
  List<Task> tasks;
  bool loading;
  String newTaskTitle;
  TasksState({this.tasks = const [], this.loading = true, this.newTaskTitle});
  @override
  TasksState clone() {
    return TasksState(
      tasks: this.tasks,
      loading: this.loading,
      newTaskTitle: this.newTaskTitle,
    );
  }
}

TasksState initState(Map<String, dynamic> args) {
  return TasksState();
}
