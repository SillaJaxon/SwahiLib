import 'package:flutter/material.dart';
import 'package:flota/navigator/main_navigator.dart';
import 'package:flota/viewmodel/global/global_viewmodel.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class DebugThemeSelectorViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final GlobalViewModel _globalViewModel;

  ThemeMode get themeMode => _globalViewModel.themeMode;

  DebugThemeSelectorViewModel(
    this._navigator,
    this._globalViewModel,
  );

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await _globalViewModel.updateThemeMode(themeMode);
  }

  void onBackClicked() => _navigator.goBack<void>();
}
