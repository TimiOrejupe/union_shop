import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/top_navbar.dart';
import 'package:union_shop/main.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('TopNavBar renders', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const TopNavBar()));
    await tester.pumpAndSettle();

    expect(find.byType(TopNavBar), findsOneWidget);
  });

  testWidgets('ProductCard builds and is present', (tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const Center(child: ProductCard(title: 'T', price: '£0', imageUrl: 'assets/images/non_existent.png')),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(ProductCard), findsOneWidget);
  });
}
