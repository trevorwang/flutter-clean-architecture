import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo/app.dart';
import 'base/fake_task_repository.dart';

void main() {
  setUp(() async {});

  testWidgets('Task list page', (WidgetTester tester) async {
    final repo = FakeTaskRepository();
    await tester.pumpWidget(createApp(repo));
    await tester.pump();
    expect(find.byType(ListView), findsNWidgets(1));
    expect(find.text("content"), findsNWidgets(2));
    expect(find.byType(Checkbox), findsNWidgets(2));
  });

  testWidgets('Task list page -- empty state', (WidgetTester tester) async {
    final repo = EmptyTaskRepository();
    await tester.pumpWidget(createApp(repo));
    await tester.pump();
    expect(find.byType(ListView), findsNWidgets(1));
    expect(find.text("content"), findsNothing);
    expect(find.byType(Checkbox), findsNothing);
  });

  testWidgets('Task list page -- loading state', (WidgetTester tester) async {
    final delay = Duration(seconds: 2);
    final repo = DelayedTaskRepository();
    await tester.pumpWidget(createApp(repo));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(delay);
  });
}
