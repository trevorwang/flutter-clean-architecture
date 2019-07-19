import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TasksPage extends Page<TasksState, Map<String, dynamic>> {
  TasksPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<TasksState>(
              adapter: null, slots: <String, Dependent<TasksState>>{}),
          middleware: <Middleware<TasksState>>[],
        );
}
