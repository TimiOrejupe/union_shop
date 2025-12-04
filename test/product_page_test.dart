import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('ProductPage builds', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const ProductPage()));
    await tester.pumpAndSettle();

    expect(find.byType(ProductPage), findsOneWidget);
  });
}
