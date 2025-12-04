import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/auth_page.dart';
import 'test_wrapper.dart';

void main() {
  testWidgets('AuthPage builds', (tester) async {
    await tester.pumpWidget(wrapWithMaterial(const AuthPage()));
    await tester.pumpAndSettle();

    expect(find.byType(AuthPage), findsOneWidget);
  });
}
