import 'dart:async';

import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:dartz/dartz.dart';

class SaveLanguageSettingUseCase
    implements UseCaseFuture<Failure, bool, Language> {
  SaveLanguageSettingUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(Language params) {
    return repository.saveLanguageSetting(params);
  }
}
