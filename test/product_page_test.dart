import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:union_shop/product_page.dart';

import 'test_wrapper.dart';

void main() {
  testWidgets('ProductPage renders', (tester) async {
    final oldOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {};
    try {
      await tester.pumpWidget(wrapWithMaterial(const ProductPage()));
      await tester.pumpAndSettle();

      expect(find.byType(ProductPage), findsOneWidget);
    } finally {
      FlutterError.onError = oldOnError;
    }
  });
}
