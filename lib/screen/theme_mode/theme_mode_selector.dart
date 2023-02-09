import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/navigator/main_navigator.get_x_navigator.dart';
import 'package:flota/navigator/middle_ware/analytics_permission_guard.dart';
import 'package:flota/navigator/middle_ware/authentication_guard.dart';
import 'package:flota/navigator/middle_ware/debug_guard.dart';
import 'package:flota/viewmodel/debug/debug_theme_selector_viewmodel.dart';
import 'package:flota/widget/debug/selector_item.dart';
import 'package:flota/widget/general/styled/flota_back_button.dart';
import 'package:flota/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';

@GetXRoute(
  middlewares: [
    AuthenticationGuard,
    AnalyticsPermissionGuard,
    DebugGuard,
  ],
)
class ThemeModeSelectorScreen extends StatefulWidget {
  static const String routeName = RouteNames.themeModeSelectorScreen;

  const ThemeModeSelectorScreen({super.key});

  @override
  ThemeModeSelectorScreenState createState() => ThemeModeSelectorScreenState();
}

@visibleForTesting
class ThemeModeSelectorScreenState extends State<ThemeModeSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugThemeSelectorViewModel>(
      create: getIt,
      childBuilderWithViewModel: (context, viewModel, theme, localization) => Scaffold(
        backgroundColor: theme.colorsTheme.background,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: FlotaBackButton.light(onClick: viewModel.onBackClicked),
          title: const Text('Select a theme mode'),
          backgroundColor: theme.colorsTheme.primary,
        ),
        body: ListView(
          children: [
            SelectorItem(
              title: localization.generalLabelSystemDefault,
              onClick: () => viewModel.updateThemeMode(ThemeMode.system),
              selected: viewModel.themeMode == ThemeMode.system,
            ),
            SelectorItem(
              title: localization.themeModeLabelLight,
              onClick: () => viewModel.updateThemeMode(ThemeMode.light),
              selected: viewModel.themeMode == ThemeMode.light,
            ),
            SelectorItem(
              title: localization.themeModeLabelDark,
              onClick: () => viewModel.updateThemeMode(ThemeMode.dark),
              selected: viewModel.themeMode == ThemeMode.dark,
            ),
          ],
        ),
      ),
    );
  }
}
