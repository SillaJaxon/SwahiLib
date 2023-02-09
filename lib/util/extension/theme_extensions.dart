import 'package:flota/di/injectable.dart';
import 'package:flota/styles/theme_data.dart';

extension ThemeExtension on Object {
  FlotaTheme get theme => getIt();
}
