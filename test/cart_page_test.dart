import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_page.dart';

void main() {
  testWidgets('CartPage builds and shows empty text', (tester) async {
    await tester.pumpWidget(MaterialApp(home: CartPage()));
    expect(find.byType(CartPage), findsOneWidget);
  });
}
