import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:showan_coffee/core/core.dart';
import 'package:showan_coffee/features/settings/settings.dart';

class GetSettingsUseCase implements UseCaseFuture<Failure, Settings, NoParams> {
  GetSettingsUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, Settings>> call(NoParams params) {
    return repository.getSettings();
  }
}
