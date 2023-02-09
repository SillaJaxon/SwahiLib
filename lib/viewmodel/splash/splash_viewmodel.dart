import 'dart:async';

import 'package:flota/navigator/main_navigator.dart';
import 'package:flota/repository/login/login_repository.dart';
import 'package:flota/repository/shared_prefs/local/local_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel with ChangeNotifierEx {
  final LoginRepository _loginRepo;
  final LocalStorage _localStorage;
  final MainNavigator _navigator;

  SplashViewModel(
    this._loginRepo,
    this._localStorage,
    this._navigator,
  );

  Future<void> init() async {
    await _localStorage.checkForNewInstallation();
    final result = await _loginRepo.isLoggedIn;
    if (result) {
      unawaited(_navigator.goToHomeScreen());
    } else {
      unawaited(_navigator.goToLoginScreen());
    }
  }
}
