part of 'transaction_bloc.dart';

enum TransactionStateStatus { initial, loading, success, failure }

class TransactionState extends Equatable {
  const TransactionState({
    this.status = TransactionStateStatus.initial,
    this.statusList = TransactionStateStatus.initial,
    this.failure,
    this.transactions = const [],
  });

  factory TransactionState.initial() {
    return const TransactionState();
  }

  final TransactionStateStatus status;
  final TransactionStateStatus statusList;
  final Failure? failure;
  final List<Transaction> transactions;

  TransactionState copyWith({
    TransactionStateStatus? status,
    TransactionStateStatus? statusList,
    Failure? failure,
    List<Transaction>? transactions,
  }) {
    return TransactionState(
      failure: failure ?? this.failure,
      status: status ?? this.status,
      statusList: statusList ?? this.statusList,
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  List<Object?> get props => [failure, status, statusList, transactions];
}
