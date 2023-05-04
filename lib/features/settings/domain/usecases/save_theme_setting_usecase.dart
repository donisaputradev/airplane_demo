import 'dart:async';

import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:dartz/dartz.dart';

class SaveThemeSettingUseCase
    implements UseCaseFuture<Failure, bool, AppTheme> {
  SaveThemeSettingUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(AppTheme params) {
    return repository.saveThemeSetting(params);
  }
}
