import 'package:flota/widget/general/styled/flota_back_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../util/test_util.dart';

void main() {
  group('FlotaBackButton dark', () {
    testWidgets('FlotaBackButton dark initial state', (tester) async {
      final sut = FlotaBackButton.dark(onClick: () {});

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flota_back_button_dark');
    });

    testWidgets('FlotaBackButton dark initial state fullscreen', (tester) async {
      final sut = FlotaBackButton.dark(
        onClick: () {},
        fullScreen: true,
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flota_back_button_full_screen_dark');
    });

    testWidgets('FlotaBackButton dark click', (tester) async {
      var clicked = false;
      final sut = FlotaBackButton.dark(onClick: () {
        clicked = true;
      });

      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(FlotaBackButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });

  group('FlotaBackButton light', () {
    testWidgets('FlotaBackButton light initial state', (tester) async {
      final sut = FlotaBackButton.light(onClick: () {});

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flota_back_button_light');
    });

    testWidgets('FlotaBackButton light initial state fullscreen', (tester) async {
      final sut = FlotaBackButton.light(
        onClick: () {},
        fullScreen: true,
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'flota_back_button_full_screen_light');
    });

    testWidgets('FlotaBackButton light click', (tester) async {
      var clicked = false;
      final sut = FlotaBackButton.light(onClick: () {
        clicked = true;
      });

      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(FlotaBackButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });
}
