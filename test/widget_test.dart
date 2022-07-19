import 'package:flutter_test/flutter_test.dart';
import 'package:irregularverbs/app.dart';

void main() {
  testWidgets(
    'App smoke test',
    (widgetTester) async {
      const app = App();
      widgetTester.pumpWidget(app);
    },
  );
}
