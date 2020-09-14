import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;
import 'package:flutter_todo/data/tasks_repository.dart';
import 'package:flutter_todo/pages/tasks_page/page.dart';

Widget createApp(TasksRepository repo) {
  final routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      "home": TasksPage(repo),
    },
    visitor: (String path, Page<Object, dynamic> page) {
      page.enhancer.append(
        viewMiddleware: <ViewMiddleware<dynamic>>[safetyView<dynamic>()],
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],
        effectMiddleware: [],
        middleware: <Middleware<dynamic>>[logMiddleware<dynamic>()],
      );
    },
  );

  return MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blue),
    home: routes.buildPage("home", null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
