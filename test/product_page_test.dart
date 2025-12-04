import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';

void main() {
  testWidgets('ProductPage builds', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProductPage()));
    expect(find.byType(ProductPage), findsOneWidget);
  });
}
