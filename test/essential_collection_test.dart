import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/essential_collection.dart';

void main() {
  testWidgets('EssentialCollection shows products and add to basket buttons', (tester) async {
    await tester.pumpWidget(MaterialApp(home: EssentialCollectionPage()));

    expect(find.text('Essential Hoodie'), findsOneWidget);
    expect(find.text('Essential T‑Shirt'), findsOneWidget);
    expect(find.text('ADD TO BASKET'), findsNWidgets(4));
  });
}
