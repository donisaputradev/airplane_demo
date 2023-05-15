import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TransactionFirebaseDataSource {
  Future<bool> createTransaction({required TransactionModel transaction});

  Future<List<TransactionModel>> getTransactions();
}

class TransactionFirebaseDataSourceImpl
    implements TransactionFirebaseDataSource {
  TransactionFirebaseDataSourceImpl(this.authFirebaseDataSource);

  final AuthFirebaseDataSource authFirebaseDataSource;

  final transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  @override
  Future<bool> createTransaction({
    required TransactionModel transaction,
  }) async {
    try {
      await transactionReference.add(transaction.toJson());
      await authFirebaseDataSource.updateBalance(
        balance: transaction.grandTotal,
      );
      return true;
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    try {
      final response = await transactionReference.get();
      final transactions = response.docs
          .map((e) => TransactionModel.fromJson(e.data()))
          .toList();
      return transactions;
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }
}
