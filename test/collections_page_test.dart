import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/collections_page.dart';

void main() {
  testWidgets('CollectionsPage displays header', (tester) async {
    await tester.pumpWidget(MaterialApp(home: CollectionsPage()));

    expect(find.byType(CollectionsPage), findsOneWidget);
  });
}
