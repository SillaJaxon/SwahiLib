import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flota/model/snackbar/snackbar_data.dart';
import 'package:flota/navigator/main_navigator.get_x_navigator.dart';
import 'package:flota/screen/splash/splash_screen.dart';
import 'package:flota/util/env/flavor_config.dart';
import 'package:flota/util/snackbar/error_util.dart';
import 'package:flota/util/snackbar/snackbar_util.dart';
import 'package:flota/widget/general/navigator_page/base_page.dart';
import 'package:get/route_manager.dart';
import 'package:get_x_navigation_generator_annotations/get_x_navigation_generator_annotations.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@GetXNavigator(pageType: BasePage)
class MainNavigator extends BaseNavigator {
  final ErrorUtil _errorUtil;

  MainNavigator(this._errorUtil);

  static final List<NavigatorObserver> _navigatorObservers = [];

  static String get initialRoute => FlavorConfig.isInTest() ? 'test_route' : SplashScreen.routeName;

  static List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  static final List<GetPage> pages = BaseNavigator.pages;

  void closeDialog() async => Get.back<void>();

  Future<void> goToDatabase(GeneratedDatabase db) async => Get.to<void>(DriftDbViewer(db));

  void showErrorWithLocaleKey(String errorKey, {List<dynamic>? args}) => _errorUtil.showErrorWithLocaleKey(errorKey, args: args);

  void showError(dynamic error) => _errorUtil.showError(error);

  Future<void> showCustomSnackBar({
    required String message,
    String? title,
    SnackBarStyle style = SnackBarStyle.neutral,
  }) async =>
      SnackBarUtil.showSnackbar(
        title: title,
        message: message,
        style: style,
      );
}
