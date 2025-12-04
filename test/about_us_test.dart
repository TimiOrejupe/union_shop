import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_us.dart';

import 'test_wrapper.dart';

void main() {
  testWidgets('AboutUsPage builds without exceptions', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const AboutUsPage()));
    await tester.pumpAndSettle();

    // Ensure no exceptions were thrown during build/layout
    final dynamic exception = tester.takeException();
    expect(exception, isNull);

    // Basic smoke checks
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(Text), findsWidgets);
  });
}
