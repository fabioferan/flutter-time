import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_time/main.dart';

void main() {
  testWidgets('Chronos scaffold smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FlutterTimeApp());
    expect(find.byType(FlutterTimeApp), findsOneWidget);
  });
}
