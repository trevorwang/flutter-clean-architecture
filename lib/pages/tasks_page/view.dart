import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/data/entity/task.dart';

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
            itemCount: getItemCount(state),
            itemBuilder: (context, index) {
              if (index == 0) {
                return ListTile(
                    title: TextField(
                  controller: TextEditingController(text: state.newTaskTitle),
                  onSubmitted: (value) {
                    dispatch(TasksActionCreator.onSaveTask(Task(title: value)));
                  },
                ));
              }

              final task = state.tasks[index - 1];
              return CheckboxListTile(
                value: task.completed ?? false,
                title: Text(task.title),
                subtitle: Text(task.content ?? ""),
                onChanged: (value) {
                  task.completed = value ?? false;
                  dispatch(TasksActionCreator.loadTasks(state.tasks));
                },
              );
            },
          ),
  );
}

int getItemCount(TasksState state) => (state.tasks?.length ?? 0) + 1;
