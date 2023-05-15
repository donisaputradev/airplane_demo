import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final Destination destination;
  final int amount;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;
  final String created;

  const Transaction({
    required this.destination,
    required this.amount,
    required this.selectedSeats,
    required this.insurance,
    required this.refundable,
    required this.vat,
    required this.price,
    required this.grandTotal,
    required this.created,
  });

  TransactionModel toData() {
    return TransactionModel(
      amount: amount,
      destination: destination.toData(),
      grandTotal: grandTotal,
      insurance: insurance,
      price: price,
      refundable: refundable,
      selectedSeats: selectedSeats,
      vat: vat,
      created: created,
    );
  }

  @override
  List<Object?> get props => [
        destination,
        amount,
        selectedSeats,
        insurance,
        refundable,
        vat,
        price,
        grandTotal,
        created,
      ];
}
