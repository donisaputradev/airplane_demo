import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.getUserUseCase}) : super(UserState.initial()) {
    on<GetUserEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: UserStateStatus.loading));
        final usecase = await getUserUseCase(const NoParams());
        usecase.fold(
          (l) {
            emit(state.copyWith(status: UserStateStatus.failure));
          },
          (r) {
            emit(state.copyWith(status: UserStateStatus.success, user: r));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });
  }

  final GetUserUseCase getUserUseCase;
}
