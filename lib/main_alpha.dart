import 'package:flutter/material.dart';
import 'package:flota/app.dart';
import 'package:flota/di/environments.dart';
import 'package:flota/di/injectable.dart';
import 'package:flota/main_common.dart';
import 'package:flota/util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.alpha,
      name: 'ALPHA',
      color: Colors.amber,
      values: values,
    );
    await configureDependencies(Environments.prod);
    runApp(const MyApp());
  });
}
