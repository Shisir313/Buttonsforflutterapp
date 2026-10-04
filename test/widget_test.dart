import 'package:flutter_test/flutter_test.dart';

import 'package:buttons/app.dart';

void main() {
  testWidgets('LoginScreen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that Login Screen is shown with Welcome Back.
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Login to Gallery'), findsOneWidget);
  });
}
