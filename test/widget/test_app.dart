import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/styles/theme_data.dart';
import 'package:flota/util/locale/localization_delegate.dart';
import 'package:flota/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:flota/viewmodel/global/global_viewmodel.dart';
import 'package:flota/widget/provider/provider_widget.dart';
import 'package:get/get.dart';

class TestApp extends StatelessWidget {
  final Widget home;
  final LocalizationDelegate? localeDelegate;

  const TestApp({
    required this.home,
    required this.localeDelegate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewModel>(
      create: () => getIt()..init(),
      lazy: true,
      consumer: (context, viewModel, consumerChild) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          if (localeDelegate == null && viewModel.localeDelegate != null) ...[
            viewModel.localeDelegate!
          ] else if (localeDelegate != null) ...[
            localeDelegate!,
          ],
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        locale: viewModel.locale,
        supportedLocales: viewModel.supportedLocales,
        themeMode: viewModel.themeMode,
        theme: FlotaThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: FlotaThemeData.darkTheme(viewModel.targetPlatform),
        home: home,
      ),
    );
  }
}
