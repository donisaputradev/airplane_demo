import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:showan_coffee/core/core.dart';
import 'package:showan_coffee/features/settings/domain/domain.dart';

class SaveLanguageSettingUseCase
    implements UseCaseFuture<Failure, bool, Language> {
  SaveLanguageSettingUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(Language params) {
    return repository.saveLanguageSetting(params);
  }
}
