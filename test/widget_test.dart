import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spendwise/main.dart';

void main() {
  testWidgets('adding a coffee updates the summary', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SpendWiseApp());

    expect(find.text('0 expenses · 0.00 USD'), findsOneWidget);

    await tester.tap(find.text('Add coffee'));
    await tester.pump();

    expect(find.text('1 expenses · 2.50 USD'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    expect(find.text('0 expenses · 0.00 USD'), findsOneWidget);
  });
}
