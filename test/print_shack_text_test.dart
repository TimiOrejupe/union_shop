import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/print_shack_text.dart';

void main() {
  testWidgets('PrintShackTextPage builds', (tester) async {
    await tester.pumpWidget(MaterialApp(home: PrintShackTextPage()));
    expect(find.byType(PrintShackTextPage), findsOneWidget);
  });
}
