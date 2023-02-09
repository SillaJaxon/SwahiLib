import 'package:flota/widget/general/styled/flota_progress_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('FlotaProgressIndicator initial state', (tester) async {
    const sut = FlotaProgressIndicator.light();

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flota_progress_indicator_light');
  });

  testWidgets('FlotaProgressIndicator initial state dark', (tester) async {
    const sut = FlotaProgressIndicator.dark();

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'flota_progress_indicator_dark');
  });
}
