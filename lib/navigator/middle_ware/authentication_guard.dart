import 'package:flutter/material.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/navigator/main_navigator.get_x_navigator.dart';
import 'package:flota/repository/secure_storage/auth/auth_storage.dart';
import 'package:flota/util/env/flavor_config.dart';
import 'package:get/route_manager.dart';

class AuthenticationGuard extends GetMiddleware {
  final authStorage = getIt.get<AuthStorage>();

  @override
  RouteSettings? redirect(String? route) {
    if (FlavorConfig.isInTest()) return null;
    return authStorage.isLoggedIn ? null : const RouteSettings(name: RouteNames.loginScreen);
  }
}
