import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/top_navbar.dart';

void main() {
  testWidgets('TopNavBar shows banner and navigation items on wide screen', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(size: Size(1200, 800)),
        child: Scaffold(body: TopNavBar()),
      ),
    ));

    expect(find.textContaining('BIG SALE'), findsOneWidget);
    expect(find.text('Collections'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
  });
}
