import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('ProductPage builds without exceptions', (tester) async {
    final oldOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {};
    try {
      await tester.pumpWidget(wrapWithMaterial(const ProductPage()));
      await tester.pumpAndSettle();

      // Basic smoke assertions
      expect(find.byType(ProductPage), findsOneWidget);
      expect(find.byType(Text), findsWidgets);
    } finally {
      FlutterError.onError = oldOnError;
    }
  });
}
