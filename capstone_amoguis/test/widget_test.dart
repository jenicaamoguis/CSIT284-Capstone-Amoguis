import 'package:flutter_test/flutter_test.dart';
import 'package:capstone_amoguis/main.dart';
import 'package:capstone_amoguis/theme_controller.dart';

void main() {
  testWidgets('Class Schedule app loads successfully', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ClassScheduleApp(themeController: ThemeController()),
    );

    expect(find.text('Class Schedule Viewer'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Timetable'), findsOneWidget);
  });

  testWidgets('Navigation switches between Home and Timetable', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ClassScheduleApp(themeController: ThemeController()),
    );

    await tester.tap(find.text('Timetable'));
    await tester.pumpAndSettle();

    expect(find.text('Your Weekly Classes'), findsOneWidget);
    expect(find.text('Monday'), findsOneWidget);
  });
}
