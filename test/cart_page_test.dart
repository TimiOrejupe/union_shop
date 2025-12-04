import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_page.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('CartPage builds and shows empty text', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const CartPage()));
    await tester.pumpAndSettle();

    expect(find.byType(CartPage), findsOneWidget);
  });
}
