import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/auth_page.dart';

void main() {
  testWidgets('AuthPage builds', (tester) async {
    await tester.pumpWidget(MaterialApp(home: AuthPage()));
    expect(find.byType(AuthPage), findsOneWidget);
  });
}
