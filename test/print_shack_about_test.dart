import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/print_shack_about.dart';

void main() {
  testWidgets('PrintShackAboutPage builds', (tester) async {
    await tester.pumpWidget(MaterialApp(home: PrintShackAboutPage()));
    expect(find.byType(PrintShackAboutPage), findsOneWidget);
  });
}
