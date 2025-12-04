import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('HomeScreen builds without exceptions', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const HomeScreen()));
    await tester.pumpAndSettle();

    final dynamic exception = tester.takeException();
    expect(exception, isNull);

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(Scaffold), findsWidgets);
  });
}
