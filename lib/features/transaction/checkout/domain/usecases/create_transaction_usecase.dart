import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:dartz/dartz.dart';

class CreateTransactionUseCase
    implements UseCaseFuture<Failure, bool, Transaction> {
  CreateTransactionUseCase(this.destinationRepository);

  final TransactionRepository destinationRepository;

  @override
  Future<Either<Failure, bool>> call(Transaction params) {
    return destinationRepository.createTransaction(
      transaction: params,
    );
  }
}
