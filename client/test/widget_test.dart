import 'package:flutter_test/flutter_test.dart';

import 'package:smartsaver/src/app.dart';

void main() {
  testWidgets('Initial screen goes home', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Home'), findsOneWidget);
  });
}
