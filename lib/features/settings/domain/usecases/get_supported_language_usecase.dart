import 'dart:async';

import 'package:airplane_demo/core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

class GetSupportedLanguageUseCase
    implements UseCaseFuture<Failure, List<Language>, SupportedLanguageParams> {
  @override
  FutureOr<Either<Failure, List<Language>>> call(
    SupportedLanguageParams params,
  ) async {
    final currentSupportedLangCode = <String>[];
    final result = <Language>[];

    for (final item in params.locales) {
      currentSupportedLangCode.add(item.languageCode);
    }

    for (final item in params.referenceLanguages) {
      if (currentSupportedLangCode.contains(item.code)) {
        result.add(item);
      }
    }

    return Right(result.toSet().toList());
  }
}

class SupportedLanguageParams {
  SupportedLanguageParams({
    required this.referenceLanguages,
    required this.locales,
  });

  final List<Language> referenceLanguages;
  final List<Locale> locales;
}
