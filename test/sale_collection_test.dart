import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/sale_collection.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('SaleCollection builds without exceptions', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const SaleCollectionPage()));
    await tester.pumpAndSettle();

    final dynamic exception = tester.takeException();
    expect(exception, isNull);

    expect(find.byType(SaleCollectionPage), findsOneWidget);
  });
}
