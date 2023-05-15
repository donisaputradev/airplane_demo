import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'seat_event.dart';
part 'seat_state.dart';

class SeatBloc extends Bloc<SeatEvent, SeatState> {
  SeatBloc() : super(SeatState.initial()) {
    on<AddSelectedEvent>((event, emit) {
      final list = [...state.selected, event.seat];
      emit(state.copyWith(
        selected: list,
        price: list.length * event.price,
      ));
    });

    on<RemoveSelectedEvent>((event, emit) {
      final list = state.selected..remove(event.seat);
      emit(state.copyWith(
        selected: list,
        price: list.length * event.price,
      ));
    });

    on<ResetSeatEvent>((event, emit) {
      emit(state.copyWith(
        selected: [],
        price: 0,
      ));
    });
  }
}
