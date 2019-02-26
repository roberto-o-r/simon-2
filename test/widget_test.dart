import 'package:flutter_test/flutter_test.dart';
import 'package:simon_2/app.dart';

void main() {
  testWidgets('App title test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Simon2App());

    // Verify that title is Simon 2.
    expect(find.text('Simon 2'), findsOneWidget);
  });
}
