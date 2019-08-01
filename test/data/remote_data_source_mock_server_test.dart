import 'dart:convert';

import 'package:mock_web_server/mock_web_server.dart';
import 'package:test/test.dart';
import 'package:flutter_todo/data/entity/task.dart';
import 'package:flutter_todo/data/source/remote/remote_data_source.dart';
import 'package:flutter_todo/data/source/remote/task_api.dart';
import 'package:flutter_todo/injection.dart';

import '../base/mock_server.dart';

void main() {
  final server = MockServer();
  final remote = RemoteDataSource(TaskApi(dio));
  setUp(() async {
    await server.start();
    dio.options.baseUrl = server.server.url;
  });

  test("get tasks", () async {
    final res = MockResponse()
      ..httpCode = 200
      ..body = json.encode([
        {
          "id": "100",
          "title": "hello",
          "content": "content",
          "completed": true,
        },
        {
          "id": "101",
          "title": "world",
          "content": "content",
          "completed": false,
        }
      ])
      ..headers = {"Content-Type": "application/json"};
    server.addResponse("/todo", res);
    final list = await remote.getTasks();
    expect(list, isNotNull);
    expect(list, isA<List<Task>>());
  });

  test("get task detail", () async {
    // final it = await remote.getTask(200);
    // expect(it, isA<Task>());
    // expect(it.id, task["id"]);
    // expect(it.title, task["title"]);
    // expect(it.content, task["content"]);
    // expect(it.completed, task["completed"]);
  });
  tearDown(() async {
    server.shutdown();
  });
}
