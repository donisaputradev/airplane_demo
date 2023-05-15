import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final DestinationModel destination;
  final int amount;
  final String selectedSeats;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;
  final String created;

  const TransactionModel({
    required this.destination,
    this.amount = 0,
    this.selectedSeats = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
    required this.created,
  });

  Transaction toEntitiy() {
    return Transaction(
      amount: amount,
      destination: destination.toEntity(),
      grandTotal: grandTotal,
      insurance: insurance,
      price: price,
      refundable: refundable,
      selectedSeats: selectedSeats,
      vat: vat,
      created: created,
    );
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        destination: DestinationModel.fromJson(
            json['destination'] as Map<String, dynamic>),
        amount: json['amount'] as int? ?? 0,
        selectedSeats: json['selectedSeats'] as String? ?? '',
        insurance: json['insurance'] as bool? ?? false,
        refundable: json['refundable'] as bool? ?? false,
        vat: (json['vat'] as num?)?.toDouble() ?? 0,
        price: json['price'] as int? ?? 0,
        grandTotal: json['grandTotal'] as int? ?? 0,
        created: json['created'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'destination': destination.toJson(),
        'amount': amount,
        'selectedSeats': selectedSeats,
        'insurance': insurance,
        'refundable': refundable,
        'vat': vat,
        'price': price,
        'grandTotal': grandTotal,
        'created': DateTime.now().toIso8601String(),
      };

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
