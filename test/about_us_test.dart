import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_us.dart';

void main() {
  testWidgets('AboutUsPage builds', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(size: Size(1200, 800)),
        child: Scaffold(body: SingleChildScrollView(child: AboutUsPage())),
      ),
    ));

    await tester.pumpAndSettle();

    expect(find.byType(AboutUsPage), findsOneWidget);
  });
}
