import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/shop_menu.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('ShopMenu builds without exceptions', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const ShopMenu()));
    await tester.pumpAndSettle();

    final dynamic exception = tester.takeException();
    expect(exception, isNull);

    expect(find.byType(ShopMenu), findsOneWidget);
  });
}
