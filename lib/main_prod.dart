import 'dart:async';
import 'dart:developer';

import 'package:airplane_demo/app/flavor.dart';
import 'package:airplane_demo/app/locator.dart';
import 'package:airplane_demo/app/runner.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.flavor = Flavor.prod;

  await setupLocator();

  runZonedGuarded(
    runnerApp,
    (error, stackTrace) => log(
      error.toString(),
      name: 'ERROR',
      stackTrace: stackTrace,
    ),
  );
}
