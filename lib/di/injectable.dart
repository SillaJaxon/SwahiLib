import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flota/db/flota_db.dart';
import 'package:flota/di/db/setup_drift_none.dart'
    if (dart.library.io) 'package:flota/di/db/setup_drift_io.dart'
    if (dart.library.js) 'package:flota/di/db/setup_drift_web.dart';
import 'package:flota/di/injectable.config.dart';
import 'package:flota/navigator/middle_ware/init_middle_ware.dart';
import 'package:flota/repository/secure_storage/secure_storage.dart';
import 'package:flota/util/env/flavor_config.dart';
import 'package:flota/util/interceptor/network_auth_interceptor.dart';
import 'package:flota/util/interceptor/network_error_interceptor.dart';
import 'package:flota/util/interceptor/network_log_interceptor.dart';
import 'package:flota/util/interceptor/network_refresh_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.asNewInstance();

@InjectableInit(
  initializerName: r'initGetIt',
  generateForDir: ['lib'],
)
Future<void> configureDependencies(String environment) async {
  // ignore: avoid_print
  print('Using environment: $environment');
  await getIt.initGetIt(environment: environment);
  await getIt.allReady();
  await initMiddleWare();
}

@module
abstract class RegisterModule {
  @singleton
  @preResolve
  Future<SharedPreferences> prefs() {
    if (FlavorConfig.isInTest()) {
      // ignore: invalid_use_of_visible_for_testing_member
      SharedPreferences.setMockInitialValues(<String, Object>{});
    }
    return SharedPreferences.getInstance();
  }

  @lazySingleton
  SharedPreferenceStorage sharedPreferences(SharedPreferences preferences) => SharedPreferenceStorage(preferences);

  @singleton
  ConnectivityHelper connectivityHelper() => ConnectivityHelper();

  @singleton
  @preResolve
  Future<DatabaseConnection> provideDatabaseConnection() {
    return createDriftDatabaseConnection('db');
  }

  @lazySingleton
  FirebaseAnalytics provideFirebaseAnalytics() => FirebaseAnalytics.instance;

  @lazySingleton
  FlutterSecureStorage storage() => const FlutterSecureStorage();

  @lazySingleton
  SimpleKeyValueStorage keyValueStorage(SharedPreferenceStorage preferences, SecureStorage secure) {
    if (kIsWeb) return preferences;
    return secure;
  }

  @lazySingleton
  CombiningSmartInterceptor provideCombiningSmartInterceptor(
    NetworkLogInterceptor logInterceptor,
    NetworkAuthInterceptor authInterceptor,
    NetworkErrorInterceptor errorInterceptor,
    NetworkRefreshInterceptor refreshInterceptor,
  ) =>
      CombiningSmartInterceptor()
        ..addInterceptor(authInterceptor)
        ..addInterceptor(refreshInterceptor)
        ..addInterceptor(errorInterceptor)
        ..addInterceptor(logInterceptor);

  @lazySingleton
  Dio provideDio(CombiningSmartInterceptor interceptor) {
    final dio = Dio(
      BaseOptions(baseUrl: FlavorConfig.instance.values.baseUrl),
    );
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    dio.interceptors.add(interceptor);
    return dio;
  }

  @lazySingleton
  FlotaDb provideFlotaDb(DatabaseConnection databaseConnection) => FlotaDb.connect(databaseConnection);
}

dynamic _parseAndDecode(String response) => jsonDecode(response);

dynamic parseJson(String text) => compute<String, dynamic>(_parseAndDecode, text);