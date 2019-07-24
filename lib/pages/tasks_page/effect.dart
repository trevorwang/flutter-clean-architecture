import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_todo/data/tasks_repository.dart';
import 'package:logger/logger.dart';
import 'action.dart';
import 'state.dart';

final logger = Logger();
Effect<TasksState> buildEffect(TasksRepository repo) {
  return combineEffects(<Object, Effect<TasksState>>{
    TasksAction.onLoadTasks: (Action action, Context<TasksState> ctx) {
      repo.getTasks().then((it) {
        ctx.dispatch(TasksActionCreator.loadTasks(it));
      }).catchError((err) {
        logger.e(err);
      });
    },
    Lifecycle.initState: (Action action, ctx) {
      ctx.dispatch(TasksActionCreator.onLoadTasks());
    },
    TasksAction.loading: (action, ctx) {
      ctx.dispatch(action);
    }
  });
}
