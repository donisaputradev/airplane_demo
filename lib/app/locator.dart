import 'package:airplane_demo/app/config.dart';
import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';

final getIt = GetIt.instance;
Future<void> setupLocator() async {
  await _setupCore();

  // |+-----------------------------------------------------------------------+|
  // |+                               FEATURES                                +|
  // |+-----------------------------------------------------------------------+|

  // ------------------------------ AUTH ---------------------------------

  // Data
  getIt
    ..registerLazySingleton<AuthFirebaseDataSource>(
      () => AuthFirebaseDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()));

  // Domain
  getIt
    ..registerLazySingleton(() => SignOutUseCase(getIt()))
    ..registerLazySingleton(() => CheckAuthUseCase(getIt()))
    ..registerLazySingleton(() => GetUserUseCase(getIt()))
    ..registerLazySingleton(() => SignInUseCase(getIt()))
    ..registerLazySingleton(() => SignUpUseCase(getIt()));

  // Presentation
  getIt
    ..registerFactory(
      () => AuthBloc(
        signOutUseCase: getIt(),
        signUpUseCase: getIt(),
        checkAuthUseCase: getIt(),
        signInUseCase: getIt(),
      ),
    )
    ..registerFactory(() => UserBloc(getUserUseCase: getIt()));

  // ------------------------------ END AUTH -------------------------------

  // ------------------------------ SETTINGS ---------------------------------

  // Data
  getIt
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSourceImpl(getIt()),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(localDataSource: getIt()),
    );

  // Domain
  getIt
    ..registerLazySingleton(() => GetLanguageSettingUseCase(getIt()))
    ..registerLazySingleton(() => GetSettingsUseCase(getIt()))
    ..registerLazySingleton(() => GetThemeSettingUseCase(getIt()))
    ..registerLazySingleton(() => SaveLanguageSettingUseCase(getIt()))
    ..registerLazySingleton(() => SaveSettingsUseCase(getIt()))
    ..registerLazySingleton(() => SaveThemeSettingUseCase(getIt()))
    ..registerLazySingleton(GetSupportedLanguageUseCase.new)
    ..registerLazySingleton(RecordErrorUseCase.new)
    ..registerLazySingleton(GetOnboardingDataUseCase.new)
    ..registerLazySingleton(() => SetDoneOnboardingUseCase(getIt()))
    ..registerLazySingleton(() => GetOnboardingStatusUseCase(getIt()));

  // Presentation
  getIt
    ..registerFactory(
      () => LanguageBloc(
        getLanguageSetting: getIt(),
        saveLanguageSetting: getIt(),
        getSupportedLanguage: getIt(),
      ),
    )
    ..registerFactory(
      () => ThemeBloc(
        getThemeSetting: getIt(),
        saveThemeSetting: getIt(),
      ),
    );

  // ------------------------------ END SETTINGS -------------------------------

  // |+-----------------------------------------------------------------------+|
  // |+                             END FEATURES                              +|
  // |+-----------------------------------------------------------------------+|
}

Future<void> _setupCore() async {
  EquatableConfig.stringify = AppConfig.autoStringifyEquatable;

  // External
  getIt.registerLazySingleton(InternetConnectionChecker.new);
  getIt.registerLazySingleton(
    () => CaptureErrorUseCase(),
  );
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(baseUrl: AppConfig.baseUrl.value)
      ..interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      ),
  );

  if (!kIsWeb) {
    final appDocDir = await getApplicationDocumentsDirectory();
    Hive.init('${appDocDir.path}/db');
  }

  getIt.registerLazySingleton<HiveInterface>(() => Hive);

  // Core
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<InternetConnectionChecker>()),
  );
}
