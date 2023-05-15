import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionRepository {
  Future<Either<Failure, bool>> createTransaction({
    required Transaction transaction,
  });

  Future<Either<Failure, List<Transaction>>> getTransactions();
}
