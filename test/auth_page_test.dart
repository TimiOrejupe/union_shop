import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/auth_page.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('AuthPage builds without exceptions', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const AuthPage()));
    await tester.pumpAndSettle();

    final dynamic exception = tester.takeException();
    expect(exception, isNull);

    expect(find.byType(AuthPage), findsOneWidget);
  });
}
