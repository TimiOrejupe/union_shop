import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/essential_collection.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('EssentialCollection shows products and add to basket buttons', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const EssentialCollectionPage()));
    await tester.pumpAndSettle();

    expect(find.text('Essential Hoodie'), findsOneWidget);
    expect(find.text('Essential T‑Shirt'), findsOneWidget);
    expect(find.text('ADD TO BASKET'), findsNWidgets(4));
  });
}
