import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/navigator/main_navigator.get_x_navigator.dart';
import 'package:flota/navigator/middle_ware/analytics_permission_guard.dart';
import 'package:flota/navigator/middle_ware/authentication_guard.dart';
import 'package:flota/styles/theme_dimens.dart';
import 'package:flota/viewmodel/license/license_viewmodel.dart';
import 'package:flota/widget/general/styled/flota_back_button.dart';
import 'package:flota/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';

@GetXRoute(
  middlewares: [
    AuthenticationGuard,
    AnalyticsPermissionGuard,
  ],
)
class LicenseScreen extends StatefulWidget {
  static const String routeName = RouteNames.licenseScreen;

  const LicenseScreen({super.key});

  @override
  LicenseScreenState createState() => LicenseScreenState();
}

@visibleForTesting
class LicenseScreenState extends State<LicenseScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LicenseViewModel>(
      create: getIt,
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => Scaffold(
        backgroundColor: theme.colorsTheme.background,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: FlotaBackButton.light(onClick: viewModel.onBackClicked),
          title: Text(localization.debugLicensesTitle),
          backgroundColor: theme.colorsTheme.primary,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(ThemeDimens.padding16),
          itemCount: viewModel.licenses.length,
          itemBuilder: (context, index) {
            final item = viewModel.licenses[index];
            return Card(
              color: theme.colorsTheme.background,
              child: Padding(
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: theme.coreTextTheme.titleNormal,
                    ),
                    Container(height: ThemeDimens.padding8),
                    Text(
                      item.license,
                      style: theme.coreTextTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
