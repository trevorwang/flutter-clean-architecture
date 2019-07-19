import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TasksState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Tasks"),
    ),
    body: state.loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: state.tasks?.length ?? 0,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return CheckboxListTile(
                value: task.completed,
                title: Text(task.title),
                subtitle: Text(task.content),
                onChanged: (value) {
                  task.completed = value;
                  dispatch(TasksActionCreator.loadTasks(state.tasks));
                },
              );
            },
          ),
  );
}
