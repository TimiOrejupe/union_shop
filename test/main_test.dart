import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('HomeScreen builds and renders', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    await tester.pumpAndSettle();

    final hasTarget = find.byType(HomeScreen).evaluate().isNotEmpty;
    final hasScaffold = find.byType(Scaffold).evaluate().isNotEmpty;
    expect(hasTarget || hasScaffold, isTrue);
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
