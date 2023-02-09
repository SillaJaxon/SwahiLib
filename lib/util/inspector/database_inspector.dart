import 'package:drift_local_storage_inspector/drift_local_storage_inspector.dart';
import 'package:flutter/foundation.dart';
import 'package:flota/db/flota_db.dart';
import 'package:flota/di/injectable.dart';
import 'package:storage_inspector/storage_inspector.dart';

Future<void> addDatabaseInspector() async {
  if (!kDebugMode) return;

  final database = getIt.get<FlotaDb>();

  final driver = StorageServerDriver(
    bundleId: 'com.icapps.flota',
    icon: 'flutter',
  );

  final sqlServer = DriftSQLDatabaseServer(
    id: "1", // A 'random' id for the server, just ensure you don't use the same one in the same project
    name: "SQL server", // Identification name for this database, shown in the plugin UI
    database: database,
  );

  driver.addSQLServer(sqlServer);

  await driver.start();

  // ignore: avoid_print
  print('Started drift inspector');
}
