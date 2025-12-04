import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/essential_collection.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('EssentialCollection builds without exceptions', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const EssentialCollectionPage()));
    await tester.pumpAndSettle();

    final dynamic exception = tester.takeException();
    expect(exception, isNull);

    expect(find.byType(EssentialCollectionPage), findsOneWidget);
  });
}
