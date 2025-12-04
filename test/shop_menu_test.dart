import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/shop_menu.dart';

void main() {
  testWidgets('ShopMenu builds', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ShopMenu())));
    expect(find.byType(ShopMenu), findsOneWidget);
  });
}
