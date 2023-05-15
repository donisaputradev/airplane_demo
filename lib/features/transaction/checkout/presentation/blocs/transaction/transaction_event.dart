part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class CreateTransactionEvent extends TransactionEvent {
  final Transaction transaction;

  const CreateTransactionEvent(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class ResetTransactionEvent extends TransactionEvent {}

class GetTransactionsEvent extends TransactionEvent {}
