import 'package:flutter/material.dart';
import 'package:flota/app.dart';
import 'package:flota/di/environments.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/main_common.dart';
import 'package:flota/util/env/flavor_config.dart';
import 'package:flota/util/inspector/database_inspector.dart';
import 'package:flota/util/inspector/local_storage_inspector.dart';
import 'package:flota/util/inspector/niddler.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initNiddler();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: true,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.dev,
      name: 'DEV',
      color: Colors.red,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main.dart');
    await configureDependencies(Environments.dev);
    await addDatabaseInspector();
    await initAllStorageInspectors();

    runApp(const MyApp());
  });
}
