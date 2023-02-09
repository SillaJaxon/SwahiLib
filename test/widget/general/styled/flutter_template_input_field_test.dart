import 'package:flota/widget/general/styled/flota_input_field.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('FlotaInputField with enabled true', (tester) async {
    final sut = FlotaInputField(
      onChanged: (value) {},
      enabled: true,
      hint: 'Hint text',
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flota_input_field_with_hint_and_enabled');
  });

  testWidgets('FlotaInputField with enabled false', (tester) async {
    final sut = FlotaInputField(
      onChanged: (value) {},
      enabled: false,
      hint: 'Hint text',
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flota_input_field_with_hint_and_disabled');
  });

  group('OnChanged', () {
    testWidgets('FlotaInputField with false value', (tester) async {
      String? newText;
      final sut = FlotaInputField(
        onChanged: (value) {
          newText = value;
        },
        enabled: true,
        hint: 'Hint text',
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flota_input_field_type_text_before');
      final finder = find.byType(FlotaInputField);
      expect(finder, findsOneWidget);
      await tester.showKeyboard(finder);
      await tester.enterText(finder, 'Testing');
      await tester.pumpAndSettle();
      await TestUtil.takeScreenshot(tester, 'flota_input_field_type_text_after');
      expect(newText, 'Testing');
    });
  });
}
