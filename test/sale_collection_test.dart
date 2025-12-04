import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sale_collection.dart';

void main() {
  testWidgets('SaleCollection builds', (tester) async {
    await tester.pumpWidget(MaterialApp(home: SaleCollectionPage()));

    expect(find.byType(SaleCollectionPage), findsOneWidget);
  });
}
