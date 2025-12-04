import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/print_shack_about.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('PrintShackAboutPage builds without exceptions', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const PrintShackAboutPage()));
    await tester.pumpAndSettle();

    final dynamic exception = tester.takeException();
    expect(exception, isNull);

    expect(find.byType(PrintShackAboutPage), findsOneWidget);
  });
}
