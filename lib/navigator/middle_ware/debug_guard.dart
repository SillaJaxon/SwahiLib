import 'package:flutter/material.dart';
import 'package:flota/navigator/main_navigator.dart';
import 'package:flota/util/env/flavor_config.dart';
import 'package:get/route_manager.dart';

class DebugGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return FlavorConfig.isProd() ? RouteSettings(name: MainNavigator.initialRoute) : null;
  }
}