part of 'destination_bloc.dart';

enum DestinationStateStatus { initial, loading, failure, success }

class DestinationState extends Equatable {
  const DestinationState({
    this.destinations = const [],
    this.destinationsPop = const [],
    this.failure,
    this.status = DestinationStateStatus.initial,
  });

  factory DestinationState.initial() {
    return const DestinationState();
  }

  final DestinationStateStatus status;
  final Failure? failure;
  final List<Destination> destinations;
  final List<Destination> destinationsPop;

  DestinationState copyWith({
    DestinationStateStatus? status,
    Failure? failure,
    List<Destination>? destinations,
    List<Destination>? destinationsPop,
  }) {
    return DestinationState(
      destinations: destinations ?? this.destinations,
      failure: failure ?? this.failure,
      status: status ?? this.status,
      destinationsPop: destinationsPop ?? this.destinationsPop,
    );
  }

  @override
  List<Object?> get props => [destinations, failure, status, destinationsPop];
}
