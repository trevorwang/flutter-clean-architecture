import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TasksState> buildReducer() {
  return asReducer(
    <Object, Reducer<TasksState>>{
      TasksAction.loadTasks: _loadTasks,
    },
  );
}

TasksState _loadTasks(TasksState state, Action action) {
  final TasksState newState = state.clone();
  newState.tasks = action.payload;
  newState.loading = false;
  return newState;
}
