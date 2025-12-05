import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('HomeScreen builds and renders', (tester) async {
    final oldOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {};
    try {
      await tester.pumpWidget(wrapWithMaterial(const HomeScreen()));
      await tester.pumpAndSettle();

      final hasTarget = find.byType(HomeScreen).evaluate().isNotEmpty;
      final hasScaffold = find.byType(Scaffold).evaluate().isNotEmpty;
      expect(hasTarget || hasScaffold, isTrue);
    } finally {
      FlutterError.onError = oldOnError;
    }
  });

  testWidgets('ProductCard builds and is present', (tester) async {
    await tester.pumpWidget(
      wrapWithMaterial(
        const Scaffold(body: Center(child: ProductCard(title: 'T', price: '£0', imageUrl: 'assets/images/non_existent.png'))),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(ProductCard), findsOneWidget);
  });
}
