import 'package:flutter/material.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/navigator/main_navigator.get_x_navigator.dart';
import 'package:flota/repository/shared_prefs/local/local_storage.dart';
import 'package:flota/util/env/flavor_config.dart';
import 'package:get/route_manager.dart';

class AnalyticsPermissionGuard extends GetMiddleware {
  final localStorage = getIt.get<LocalStorage>();

  @override
  RouteSettings? redirect(String? route) {
    if (FlavorConfig.isInTest()) return null;
    return localStorage.hasAnalyticsPermission != true ? const RouteSettings(name: RouteNames.analyticsPermissionScreen) : null;
  }
}
