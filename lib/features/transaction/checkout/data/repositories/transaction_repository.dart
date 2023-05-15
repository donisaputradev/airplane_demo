import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:dartz/dartz.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  TransactionRepositoryImpl(this.transactionFirebaseDataSource);

  final TransactionFirebaseDataSource transactionFirebaseDataSource;

  @override
  Future<Either<Failure, bool>> createTransaction({
    required Transaction transaction,
  }) async {
    try {
      final result = await transactionFirebaseDataSource.createTransaction(
        transaction: transaction.toData(),
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, List<Transaction>>> getTransactions() async {
    try {
      final result = await transactionFirebaseDataSource.getTransactions();
      final transactions = result.map((e) => e.toEntitiy()).toList();
      return Right(transactions);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }
}
