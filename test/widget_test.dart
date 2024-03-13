import 'package:flutter_riverpod_base/src/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test 1', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
  });
}
