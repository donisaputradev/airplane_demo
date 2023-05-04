import 'dart:async';

import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:dartz/dartz.dart';

class SetDoneOnboardingUseCase
    implements UseCaseFuture<Failure, bool, NoParams> {
  const SetDoneOnboardingUseCase(this.repository);

  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(NoParams params) {
    return repository.setDoneOnboarding();
  }
}
