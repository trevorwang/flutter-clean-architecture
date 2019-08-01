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
                return _newTaskWidget(state, dispatch);
              }
              final i = state.tasks.length - index;
              final task = state.tasks[i];

              return ListTile(
                title: Row(
                  children: <Widget>[
                    Checkbox(
                      value: task.completed ?? false,
                      onChanged: (value) {
                        task.completed = value ?? false;
                        dispatch(TasksActionCreator.loadTasks(state.tasks));
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          task.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          task.content ?? "",
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
  );
}

ListTile _newTaskWidget(TasksState state, Dispatch dispatch) {
  return ListTile(
      title: TextField(
    controller: TextEditingController(text: state.newTaskTitle),
    onSubmitted: (value) {
      if (value.isNotEmpty) {
        dispatch(TasksActionCreator.onSaveTask(Task(title: value)));
      }
    },
  ));
}

int getItemCount(TasksState state) => (state.tasks?.length ?? 0) + 1;
