import 'package:flota/di/injectable.dart';
import 'package:flota/repository/secure_storage/auth/auth_storage.dart';

Future<void> initMiddleWare() async {
  await getIt<AuthStorage>().hasLoggedInUser();
}
