import 'package:flota/db/flota_db.dart';
import 'package:flota/navigator/main_navigator.dart';
import 'package:flota/repository/debug/debug_repository.dart';
import 'package:flota/repository/shared_prefs/local/local_storage.dart';
import 'package:flota/widget/debug/select_language_dialog.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class DebugViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final DebugRepository _debugRepo;
  final LocalStorage _localStorage;
  final FlotaDb _db;

  var slowAnimationsEnabled = false;

  DebugViewModel(
    this._debugRepo,
    this._navigator,
    this._db,
    this._localStorage,
  );

  Future<void> init() async {
    _initValues();
  }

  void _initValues() {
    slowAnimationsEnabled = _debugRepo.isSlowAnimationsEnabled();
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> onSlowAnimationsChanged(bool enabled) async {
    await _debugRepo.saveSlowAnimations(enabled: enabled);
    _initValues();
  }

  void onTargetPlatformClicked() => _navigator.goToDebugPlatformSelectorScreen();

  void onThemeModeClicked() => _navigator.goToThemeModeSelectorScreen();

  void onSelectLanguageClicked() => _navigator.showCustomDialog<void>(widget: SelectLanguageDialog(goBack: _navigator.closeDialog));

  void onLicensesClicked() => _navigator.goToLicenseScreen();

  void goToDatabase() => _navigator.goToDatabase(_db);

  void goToAnalyticsPermissionScreen() => _navigator.goToAnalyticsPermissionScreen();

  void resetAnalyticsPermission() => _localStorage.updateHasAnalyticsPermission(null);
}
