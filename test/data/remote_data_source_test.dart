import 'package:test/test.dart';
import 'package:flutter_todo/data/entity/task.dart';
import 'package:flutter_todo/data/source/remote/remote_data_source.dart';
import 'package:flutter_todo/data/source/remote/task_api.dart';
import 'package:flutter_todo/injection.dart';

import '../base/mock_http_client.dart';

void main() {
  RemoteDataSource remote;
  setUp(() async {
    dio.httpClientAdapter = mockClient;
    remote = RemoteDataSource(TaskApi(dio));
  });

  test("get tasks", () async {
    mockTaskList();
    final list = await remote.getTasks();
    expect(list, isNotNull);
    expect(list, isA<List<Task>>());
  });

  test("get task detail", () async {
    final task = mockTaskDetail();
    final it = await remote.getTask("200");
    expect(it, isA<Task>());
    expect(it.id, task["id"]);
    expect(it.title, task["title"]);
    expect(it.content, task["content"]);
    expect(it.completed, task["completed"]);
  });
}
