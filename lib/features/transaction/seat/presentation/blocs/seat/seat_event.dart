part of 'seat_bloc.dart';

abstract class SeatEvent extends Equatable {
  const SeatEvent();

  @override
  List<Object> get props => [];
}

class ResetSeatEvent extends SeatEvent {}

class AddSelectedEvent extends SeatEvent {
  final String seat;
  final int price;

  const AddSelectedEvent(this.seat, this.price);

  @override
  List<Object> get props => [seat, price];
}

class RemoveSelectedEvent extends SeatEvent {
  final String seat;
  final int price;

  const RemoveSelectedEvent(this.seat, this.price);

  @override
  List<Object> get props => [seat, price];
}
