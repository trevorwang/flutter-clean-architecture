import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_todo/data/entity/task.dart';

enum TasksAction {
  loadTasks,
  onLoadTasks,
  loading,
  createTask,
  onSaveTask,
  clearNewInput,
}

class TasksActionCreator {
  static Action onLoadTasks() {
    return const Action(TasksAction.onLoadTasks);
  }

  static Action loadTasks(List<Task> tasks) {
    return Action(TasksAction.loadTasks, payload: tasks);
  }

  static Action loading() {
    return const Action(TasksAction.loading);
  }

  static Action onSaveTask(Task task) {
    return Action(TasksAction.onSaveTask, payload: task);
  }

  static Action createTask(Task task) {
    return Action(TasksAction.createTask, payload: task);
  }

  static Action clearNewInput() {
    return Action(TasksAction.clearNewInput);
  }
}
