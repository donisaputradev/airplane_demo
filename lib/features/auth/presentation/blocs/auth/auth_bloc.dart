import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.signOutUseCase,
    required this.signUpUseCase,
    required this.checkAuthUseCase,
    required this.signInUseCase,
  }) : super(AuthState.initial()) {
    on<SignInEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStateStatus.loading));
        final usecase = await signInUseCase(SignInParams(
          email: event.email,
          password: event.password,
        ));
        usecase.fold(
          (l) {
            emit(state.copyWith(
              status: AuthStateStatus.failure,
              failure: l,
            ));
          },
          (r) {
            emit(state.copyWith(status: AuthStateStatus.authorized));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    on<SignUpEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStateStatus.loading));
        final usecase = await signUpUseCase(SignUpParams(
          name: event.name,
          email: event.email,
          password: event.password,
          hobby: event.hobby,
        ));
        usecase.fold(
          (l) {
            emit(state.copyWith(
              status: AuthStateStatus.failure,
              failure: l,
            ));
          },
          (r) {
            emit(state.copyWith(status: AuthStateStatus.authorized));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    on<SignOutEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStateStatus.loading));
        final usecase = await signOutUseCase(const NoParams());
        usecase.fold((l) {
          emit(state.copyWith(
            status: AuthStateStatus.failure,
            failure: l,
          ));
        }, (r) {
          emit(state.copyWith(
            status: AuthStateStatus.unauthorized,
            email: null,
            name: null,
            password: null,
          ));
        });
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    on<NameChangeEvent>((event, emit) async {
      try {
        final name = NameFormZ.dirty(event.name);
        emit(
          state.copyWith(
            name: name,
            status: AuthStateStatus.initial,
          ),
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    on<EmailChangeEvent>((event, emit) async {
      try {
        final email = EmailFormZ.dirty(event.email);
        emit(
          state.copyWith(
            email: email,
            status: AuthStateStatus.initial,
          ),
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    on<PasswordChangeEvent>((event, emit) async {
      try {
        final password = PasswordFormZ.dirty(event.password);
        emit(
          state.copyWith(
            password: password,
            status: AuthStateStatus.initial,
          ),
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    on<CheckAuthEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: AuthStateStatus.loading));
        await Future.delayed(const Duration(seconds: 2));
        final usecase = await checkAuthUseCase(const NoParams());
        usecase.fold(
          (l) {
            emit(state.copyWith(status: AuthStateStatus.failure, failure: l));
          },
          (r) {
            if (r != null) {
              emit(state.copyWith(status: AuthStateStatus.authorized));
            } else {
              emit(state.copyWith(status: AuthStateStatus.unauthorized));
            }
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });
  }

  final SignOutUseCase signOutUseCase;
  final SignUpUseCase signUpUseCase;
  final CheckAuthUseCase checkAuthUseCase;
  final SignInUseCase signInUseCase;
}
