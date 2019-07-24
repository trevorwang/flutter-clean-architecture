import 'dart:convert';
import 'dart:io';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'data.dart';

class HttpMockClient extends Mock implements HttpClientAdapter {}

final mockClient = HttpMockClient();

void mockTaskList() {
  mockSuccess(json.encode(taskList));
}

void mockEmptyTaskList() {
  mockSuccess(json.encode([]));
}

Map<String, dynamic> mockTaskDetail() {
  mockSuccess(json.encode(taskDetail));
  return taskDetail;
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
