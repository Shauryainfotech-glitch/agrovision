import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:agrovision_mobile/main.dart';

void main() {
  testWidgets('AgroVision app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AgroVisionApp());

    // Verify that we have the app title
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
