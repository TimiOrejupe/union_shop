import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  testWidgets('HomeScreen builds and shows hero text', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.textContaining('Essential Range'), findsOneWidget);
    expect(find.text('BROWSE PRODUCTS'), findsOneWidget);
  });

  testWidgets('ProductCard displays title and price', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ProductCard(title: 'Test Product', price: '£9.99', imageUrl: 'assets/images/non_existent.png'),
      ),
    ));

    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('£9.99'), findsOneWidget);
  });
}
