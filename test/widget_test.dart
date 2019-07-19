// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
}
