import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/navigator/main_navigator.get_x_navigator.dart';
import 'package:flota/navigator/middle_ware/authentication_guard.dart';
import 'package:flota/styles/theme_assets.dart';
import 'package:flota/viewmodel/permission/analytics_permission_viewmodel.dart';
import 'package:flota/widget/general/styled/flota_button.dart';
import 'package:flota/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';

@GetXRoute(
  middlewares: [
    AuthenticationGuard,
  ],
)
class AnalyticsPermissionScreen extends StatelessWidget {
  static const String routeName = RouteNames.analyticsPermissionScreen;

  const AnalyticsPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<AnalyticsPermissionViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: theme.isDarkTheme ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: theme.colorsTheme.permissionScreenBackground,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 5,
                          child: SvgPicture.asset(
                            ThemeAssets.analyticsImage(context),
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 32),
                        Text(
                          localization.permissionAnalyticsTitle,
                          style: theme.coreTextTheme.titleNormal,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          localization.permissionAnalyticsDescription,
                          textAlign: TextAlign.center,
                          style: theme.coreTextTheme.bodyNormal,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                FlotaButton(
                  text: localization.permissionButtonAccept,
                  onClick: viewModel.onAcceptClicked,
                ),
                const SizedBox(height: 8),
                FlotaButton.text(
                  text: localization.permissionButtonMoreInfo,
                  onClick: viewModel.onMoreInfoClicked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
