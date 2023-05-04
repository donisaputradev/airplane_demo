import 'dart:async';

import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:dartz/dartz.dart';

class SaveSettingsUseCase implements UseCaseFuture<Failure, bool, Settings> {
  SaveSettingsUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(Settings params) {
    return repository.saveSettings(params);
  }
}
