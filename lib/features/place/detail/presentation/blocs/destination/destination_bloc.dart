import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'destination_event.dart';
part 'destination_state.dart';

class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  DestinationBloc({required this.getDestinationUseCase})
      : super(DestinationState.initial()) {
    on<GetDestinationEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: DestinationStateStatus.loading));
        final usecase = await getDestinationUseCase(const NoParams());
        usecase.fold(
          (l) {
            emit(state.copyWith(
              status: DestinationStateStatus.failure,
              failure: l,
            ));
          },
          (r) {
            final destinations = r;
            destinations.sort((a, b) => b.rating.compareTo(a.rating));
            emit(
              state.copyWith(
                status: DestinationStateStatus.success,
                destinations: r,
                destinationsPop: destinations.take(5).toList(),
              ),
            );
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });
  }

  final GetDestinationUseCase getDestinationUseCase;
}
