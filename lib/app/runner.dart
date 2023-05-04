import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void runnerApp() {
  Bloc.observer = AppBlocObserver();

  runZonedGuarded(
    () async {
      return runApp(const App());
    },
    (error, stackTrace) {
      // Implement Logging Error in this body,
      // like Sentry of Firebase Crashlytics
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
