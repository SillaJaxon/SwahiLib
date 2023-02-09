import 'package:flutter/widgets.dart';
import 'package:flota/styles/theme_data.dart';
import 'package:flota/util/locale/localization.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class DataProviderWidget extends BaseThemeProviderWidget<FlotaTheme, Localization> {
  const DataProviderWidget({
    Widget Function(BuildContext context, FlotaTheme theme)? childBuilderTheme,
    Widget Function(BuildContext context, Localization localization)? childBuilderLocalization,
    Widget Function(BuildContext context, FlotaTheme theme, Localization localization)? childBuilder,
  }) : super(
          childBuilderTheme: childBuilderTheme,
          childBuilderLocalization: childBuilderLocalization,
          childBuilder: childBuilder,
        );
}
