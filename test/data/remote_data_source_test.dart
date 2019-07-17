import 'dart:convert';
import 'dart:io';

import 'package:flutter_todo/data/entity/task.dart';
import 'package:flutter_todo/data/source/remote/remote_data_source.dart';
import 'package:flutter_todo/data/source/remote/task_api.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements HttpClientAdapter {}

final mockClient = MockClient();
void main() {
  RemoteDataSource remote;

  setUp(() async {
    final dio = Dio();
    dio.httpClientAdapter = mockClient;
    remote = RemoteDataSource(TaskApi(dio));
  });

  test("get tasks", () async {
    when(mockClient.fetch(any, any, any)).thenAnswer((_) {
      final res = ResponseBody.fromString(
          json.encode([
            {
              "id": 100,
              "title": "hello",
              "content": "content",
              "completed": true,
            }
          ]),
          200,
          headers: DioHttpHeaders.fromMap({
            HttpHeaders.contentTypeHeader: ContentType.json,
          }));
      return Future.value(res);
    });

    final list = await remote.getTasks();
    expect(list, isNotNull);
    expect(list, isA<List<Task>>());
  });

  test("get task detail", () async {
    final task = {
      "id": 100,
      "title": "hello",
      "content": "content",
      "completed": true,
    };
    when(mockClient.fetch(any, any, any)).thenAnswer((_) {
      final res = ResponseBody.fromString(json.encode(task), 200,
          headers: DioHttpHeaders.fromMap({
            HttpHeaders.contentTypeHeader: ContentType.json,
          }));
      return Future.value(res);
    });

    final it = await remote.getTask(200);
    expect(it, isA<Task>());
    expect(it.id, task["id"]);
    expect(it.title, task["title"]);
    expect(it.content, task["content"]);
    expect(it.completed, task["completed"]);
  });
}
