import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tteung/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: TteungApp(),
      ),
    );

    // 홈 화면이 표시되는지 확인
    expect(find.text('홈 화면'), findsOneWidget);
  });
}
