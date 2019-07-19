import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:flutter_todo/app.dart';
import 'package:flutter_todo/injection.dart';

import 'base/mock_http_client.dart';

void main() {
  setUp(() async {
    dio.httpClientAdapter = mockClient;
  });

  testWidgets('Task list page', (WidgetTester tester) async {
    mockTaskList();
    await tester.pumpWidget(createApp());
    await tester.pump();
    expect(find.byType(ListView), findsNWidgets(1));
    expect(find.text("content"), findsNWidgets(2));
    expect(find.byType(Checkbox), findsNWidgets(2));
  });

  testWidgets('Task list page -- empty state', (WidgetTester tester) async {
    mockEmptyTaskList();
    await tester.pumpWidget(createApp());
    await tester.pump();
    expect(find.byType(ListView), findsNWidgets(1));
    expect(find.text("content"), findsNothing);
    expect(find.byType(Checkbox), findsNothing);
  });

  testWidgets('Task list page -- loading state', (WidgetTester tester) async {
    final delay = Duration(seconds: 2);
    when(mockClient.fetch(any, any, any)).thenAnswer((_) {
      final res = ResponseBody.fromString("[]", 200,
          headers: DioHttpHeaders.fromMap({
            HttpHeaders.contentTypeHeader: ContentType.json,
          }));
      return Future.delayed(delay, () => res);
    });
    await tester.pumpWidget(createApp());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(delay);
  });
}
