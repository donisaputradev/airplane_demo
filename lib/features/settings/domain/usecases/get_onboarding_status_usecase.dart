import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:showan_coffee/core/core.dart';
import 'package:showan_coffee/features/settings/settings.dart';

class GetOnboardingStatusUseCase
    implements UseCaseFuture<Failure, bool, NoParams> {
  const GetOnboardingStatusUseCase(this.repository);

  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(NoParams params) {
    return repository.getOnboardingStatus();
  }
}
