import 'dart:convert';
import 'dart:io';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

class HttpMockClient extends Mock implements HttpClientAdapter {}

final mockClient = HttpMockClient();

void mockTaskList() {
  mockSuccess(json.encode([
    {
      "id": 100,
      "title": "hello",
      "content": "content",
      "completed": true,
    },
    {
      "id": 101,
      "title": "world",
      "content": "content",
      "completed": false,
    }
  ]));
}

void mockEmptyTaskList() {
  mockSuccess(json.encode([]));
}

Map<String, dynamic> mockTaskDetail() {
  final task = {
    "id": 100,
    "title": "hello",
    "content": "content",
    "completed": true,
  };
  mockSuccess(json.encode(task));
  return task;
}

void mockSuccess(final String result) {
  when(mockClient.fetch(any, any, any)).thenAnswer((_) {
    final res = ResponseBody.fromString(result, 200,
        headers: DioHttpHeaders.fromMap({
          HttpHeaders.contentTypeHeader: ContentType.json,
        }));
    return Future.value(res);
  });
}
