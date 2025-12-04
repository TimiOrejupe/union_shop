import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/collections_page.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('CollectionsPage displays header', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const CollectionsPage()));
    await tester.pumpAndSettle();

    expect(find.byType(CollectionsPage), findsOneWidget);
  });
}
