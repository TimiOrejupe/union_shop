import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/top_navbar.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('TopNavBar shows banner and navigation items on wide screen', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const TopNavBar()));
    await tester.pumpAndSettle();

    expect(find.textContaining('BIG SALE'), findsOneWidget);
    expect(find.text('Collections'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
  });
}
