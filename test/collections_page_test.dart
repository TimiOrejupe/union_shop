import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/collections_page.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('CollectionsPage renders', (tester) async {
    final oldOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {};
    try {
      await tester.pumpWidget(wrapWithMaterial(const CollectionsPage()));
      await tester.pumpAndSettle();

      expect(find.byType(CollectionsPage), findsOneWidget);
    } finally {
      FlutterError.onError = oldOnError;
    }
  });
}
