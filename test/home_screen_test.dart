import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  testWidgets('HomeScreen hero shows heading and browse button', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.textContaining('Essential Range'), findsOneWidget);
    expect(find.text('BROWSE PRODUCTS'), findsOneWidget);
  });
}
