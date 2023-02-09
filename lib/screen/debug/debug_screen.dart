import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/navigator/main_navigator.get_x_navigator.dart';
import 'package:flota/navigator/middle_ware/analytics_permission_guard.dart';
import 'package:flota/navigator/middle_ware/authentication_guard.dart';
import 'package:flota/navigator/middle_ware/debug_guard.dart';
import 'package:flota/util/keys.dart';
import 'package:flota/viewmodel/debug/debug_viewmodel.dart';
import 'package:flota/viewmodel/global/global_viewmodel.dart';
import 'package:flota/widget/debug/debug_row_item.dart';
import 'package:flota/widget/debug/debug_row_title.dart';
import 'package:flota/widget/debug/debug_switch_row_item.dart';
import 'package:flota/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:provider/provider.dart';

@GetXRoute(
  middlewares: [
    AuthenticationGuard,
    AnalyticsPermissionGuard,
    DebugGuard,
  ],
)
class DebugScreen extends StatefulWidget {
  static const String routeName = RouteNames.debugScreen;

  const DebugScreen({super.key});

  @override
  DebugScreenState createState() => DebugScreenState();
}

@visibleForTesting
class DebugScreenState extends State<DebugScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => Scaffold(
        backgroundColor: theme.colorsTheme.background,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text(localization.settingsTitle),
          backgroundColor: theme.colorsTheme.primary,
        ),
        body: ListView(
          children: [
            DebugRowTitle(title: localization.debugAnimationsTitle),
            DebugRowSwitchItem(
              key: Keys.debugSlowAnimations,
              title: localization.debugSlowAnimations,
              value: viewModel.slowAnimationsEnabled,
              onChanged: viewModel.onSlowAnimationsChanged,
            ),
            DebugRowTitle(title: localization.debugThemeTitle),
            DebugRowItem(
              key: Keys.debugTargetPlatform,
              title: localization.debugTargetPlatformTitle,
              subTitle: localization.debugTargetPlatformSubtitle(localization.getTranslation(Provider.of<GlobalViewModel>(context).getCurrentPlatform())),
              onClick: viewModel.onTargetPlatformClicked,
            ),
            DebugRowItem(
              key: Keys.debugThemeMode,
              title: localization.debugThemeModeTitle,
              subTitle: localization.debugThemeModeSubtitle,
              onClick: viewModel.onThemeModeClicked,
            ),
            DebugRowTitle(title: localization.debugLocaleTitle),
            DebugRowItem(
              key: Keys.debugSelectLanguage,
              title: localization.debugLocaleSelector,
              subTitle: localization.debugLocaleCurrentLanguage(Provider.of<GlobalViewModel>(context).getCurrentLanguage()),
              onClick: viewModel.onSelectLanguageClicked,
            ),
            DebugRowSwitchItem(
              key: Keys.debugShowTranslations,
              title: localization.debugShowTranslations,
              value: Provider.of<GlobalViewModel>(context, listen: false).showsTranslationKeys,
              onChanged: (_) => Provider.of<GlobalViewModel>(context, listen: false).toggleTranslationKeys(),
            ),
            DebugRowTitle(title: localization.debugLicensesTitle),
            DebugRowItem(
              key: Keys.debugLicense,
              title: localization.debugLicensesGoTo,
              onClick: viewModel.onLicensesClicked,
            ),
            DebugRowTitle(title: localization.debugDatabase),
            DebugRowItem(
              key: Keys.debugDatabase,
              title: localization.debugViewDatabase,
              onClick: viewModel.goToDatabase,
            ),
            DebugRowTitle(title: localization.debugPermissionsTitle),
            DebugRowItem(
              key: Keys.debugPermissionAnalytics,
              title: localization.debugPermissionsShowAnalyticsPermission,
              onClick: viewModel.goToAnalyticsPermissionScreen,
            ),
            DebugRowItem(
              key: Keys.debugPermissionAnalyticsReset,
              title: localization.debugPermissionResetAnalytics,
              onClick: viewModel.resetAnalyticsPermission,
            ),
          ],
        ),
      ),
    );
  }
}
