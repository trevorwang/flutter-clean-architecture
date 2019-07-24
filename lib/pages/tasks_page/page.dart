import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_todo/data/tasks_repository.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TasksPage extends Page<TasksState, Map<String, dynamic>> {
  TasksPage(TasksRepository repo)
      : super(
          initState: initState,
          effect: buildEffect(repo),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<TasksState>(
              adapter: null, slots: <String, Dependent<TasksState>>{}),
          middleware: <Middleware<TasksState>>[],
        );
}
