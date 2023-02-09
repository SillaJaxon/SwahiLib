import 'package:flutter/material.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/navigator/main_navigator.get_x_navigator.dart';
import 'package:flota/viewmodel/splash/splash_viewmodel.dart';
import 'package:flota/widget/general/status_bar.dart';
import 'package:flota/widget/general/styled/flota_progress_indicator.dart';
import 'package:flota/widget/provider/provider_widget.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';

@GetXRoute(
  navigationType: NavigationType.popAllAndPush,
)
class SplashScreen extends StatefulWidget {
  static const String routeName = RouteNames.splashScreen;

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

@visibleForTesting
class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SplashViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => StatusBar.animated(
        isDarkStyle: theme.isDarkTheme,
        child: Scaffold(
          backgroundColor: theme.colorsTheme.primary,
          body: const Center(
            child: FlotaProgressIndicator.light(),
          ),
        ),
      ),
    );
  }
}
