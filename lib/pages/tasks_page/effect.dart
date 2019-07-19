import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import '../../injection.dart';

Effect<TasksState> buildEffect() {
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
