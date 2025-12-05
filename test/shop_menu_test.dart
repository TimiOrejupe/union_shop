import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/shop_menu.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('ShopMenu renders', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const ShopMenu()));
    await tester.pumpAndSettle();

    expect(find.byType(ShopMenu), findsOneWidget);
  });
}
