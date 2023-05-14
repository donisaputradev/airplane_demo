import 'dart:async';
import 'dart:developer';

import 'package:airplane_demo/app/app.dart';
import 'package:airplane_demo/app/flavor.dart';
import 'package:airplane_demo/app/locator.dart';
import 'package:airplane_demo/core/core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options_dev.dart';

Future<void> main() async {
  F.flavor = Flavor.dev;

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await setupLocator();

      Bloc.observer = AppBlocObserver();

      return runApp(const App());
    },
    (error, stackTrace) {
      GetIt.I<CaptureErrorUseCase>().call(
        CaptureErrorParams(error, stackTrace),
      );
      log(
        error.toString(),
        name: 'LOG',
        stackTrace: stackTrace,
      );
    },
  );
}
