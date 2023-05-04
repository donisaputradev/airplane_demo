import 'dart:async';

import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:airplane_demo/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({
    required this.getLanguageSetting,
    required this.saveLanguageSetting,
    required this.getSupportedLanguage,
  }) : super(const LanguageState(null, [])) {
    on<LanguageStarted>(_onLanguageStarted);
    on<LanguageChanged>(_onLanguageChanged);
  }

  final GetLanguageSettingUseCase getLanguageSetting;
  final SaveLanguageSettingUseCase saveLanguageSetting;
  final GetSupportedLanguageUseCase getSupportedLanguage;

  Future _onLanguageStarted(
    LanguageStarted event,
    Emitter<LanguageState> emit,
  ) async {
    try {
      final savedData = await getLanguageSetting(const NoParams());
      final languages = await _getSupportedLanguages();

      emit(state.copyWith(supportedLanguages: languages));

      emit(
        savedData.fold(
          (failure) => state,
          (data) => state.copyWith(
            language: data,
            supportedLanguages: languages,
          ),
        ),
      );
    } catch (exception, stackTrace) {
      exception.recordError(
        RecordErrorParams(exception: exception, stackTrace: stackTrace),
      );
    }
  }

  Future _onLanguageChanged(
    LanguageChanged event,
    Emitter<LanguageState> emit,
  ) async {
    try {
      final result = await saveLanguageSetting(event.language);

      if (result.isRight()) {
        add(const LanguageStarted());
      }
    } catch (exception, stackTrace) {
      exception.recordError(
        RecordErrorParams(exception: exception, stackTrace: stackTrace),
      );
    }
  }

  Future<List<Language>> _getSupportedLanguages() async {
    final result = await getSupportedLanguage(
      SupportedLanguageParams(
        locales: AppLocalizations.supportedLocales,
        referenceLanguages: LanguagesData.data,
      ),
    );

    return result.getOrElse(() => []);
  }
}
