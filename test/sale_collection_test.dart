import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sale_collection.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('SaleCollection builds', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const SaleCollectionPage()));
    await tester.pumpAndSettle();

    expect(find.byType(SaleCollectionPage), findsOneWidget);
  });
}
