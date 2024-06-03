import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project/screens/home.dart'; // Make sure this import path is correct
import 'package:project/screens/enroll_child.dart';
import 'package:project/screens/add_classroom.dart';
import 'package:project/screens/view_classrooms.dart';
import 'package:project/screens/parentView/parent_home.dart';
import 'package:project/screens/add_parent.dart';
import 'package:project/screens/login.dart';

void main() {
  testWidgets('HomePage widget test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.text('Enroll Child'), findsOneWidget);
    expect(find.text('Add Classroom'), findsOneWidget);
    expect(find.text('Classrooms'), findsOneWidget);
    // expect(find.text('Parent Home'), findsOneWidget);
    expect(find.text('Add Parent'), findsOneWidget);
    expect(find.text('Go Back'), findsOneWidget);

    await tester.tap(find.text('Enroll Child'));
    await tester.pumpAndSettle();
    expect(find.byType(EnrollChild), findsOneWidget);
    Navigator.of(tester.element(find.byType(EnrollChild))).pop();
    await tester.pumpAndSettle();

    // Add Classroom
    await tester.tap(find.text('Add Classroom'));
    await tester.pumpAndSettle();
    expect(find.byType(AddClassroom), findsOneWidget);
    Navigator.of(tester.element(find.byType(AddClassroom))).pop();
    await tester.pumpAndSettle();

    // View Classrooms
    await tester.tap(find.text('Classrooms'));
    await tester.pumpAndSettle();
    expect(find.byType(ViewClassrooms), findsOneWidget);
    Navigator.of(tester.element(find.byType(ViewClassrooms))).pop();
    await tester.pumpAndSettle();

    // Parent Home
    await tester.tap(find.text('Parent Home'));
    await tester.pumpAndSettle();
    expect(find.byType(ParentHome), findsOneWidget);
    Navigator.of(tester.element(find.byType(ParentHome))).pop();
    await tester.pumpAndSettle();

    // Add Parent
    await tester.tap(find.text('Add Parent'));
    await tester.pumpAndSettle();
    expect(find.byType(AddParent), findsOneWidget);
    Navigator.of(tester.element(find.byType(AddParent))).pop();
    await tester.pumpAndSettle();

    // Go Back
    await tester.tap(find.text('Go Back'));
    await tester.pumpAndSettle();
    expect(find.byType(LoginPage), findsOneWidget);
    Navigator.of(tester.element(find.byType(LoginPage))).pop();
    await tester.pumpAndSettle();
  });
}
