import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:dartz/dartz.dart';

class GetTransactionsUseCase
    implements UseCaseFuture<Failure, List<Transaction>, NoParams> {
  GetTransactionsUseCase(this.transactionRepository);

  final TransactionRepository transactionRepository;

  @override
  Future<Either<Failure, List<Transaction>>> call(NoParams params) {
    return transactionRepository.getTransactions();
  }
}
