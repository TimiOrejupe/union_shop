import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/print_shack_text.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('PrintShackTextPage builds without exceptions', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const PrintShackTextPage()));
    await tester.pumpAndSettle();

    final dynamic exception = tester.takeException();
    expect(exception, isNull);

    expect(find.byType(PrintShackTextPage), findsOneWidget);
  });
}
