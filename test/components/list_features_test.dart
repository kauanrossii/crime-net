import 'package:crime_net/components/list_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('List features must contain two cards of features',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ListFeatures(),
      ),
    ));

    expect(find.byType(Card), findsExactly(2));
  });
}
