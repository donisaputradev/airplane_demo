import 'package:showan_coffee/features/settings/settings.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<NavigateSplashEvent>(_navigate);
  }

  Future _navigate(
    NavigateSplashEvent event,
    Emitter<SplashState> emit,
  ) async {
    try {
      emit(SplashLoading());
      await Future.delayed(const Duration(seconds: 3))
          .whenComplete(() => emit(SplashSuccess()));
    } catch (exception, stackTrace) {
      exception.recordError(
        RecordErrorParams(exception: exception, stackTrace: stackTrace),
      );
    }
  }
}
