import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_us.dart';

void main() {
  testWidgets('AboutUsPage builds', (tester) async {
    await tester.pumpWidget(MaterialApp(home: AboutUsPage()));
    expect(find.byType(AboutUsPage), findsOneWidget);
  });
}
