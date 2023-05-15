part of 'seat_bloc.dart';

class SeatState extends Equatable {
  const SeatState({
    this.price = 0,
    this.selected = const [],
  });

  factory SeatState.initial() {
    return const SeatState();
  }

  final List<String> selected;
  final int price;

  SeatState copyWith({
    List<String>? selected,
    int? price,
  }) {
    return SeatState(
      price: price ?? this.price,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [selected, price];
}
