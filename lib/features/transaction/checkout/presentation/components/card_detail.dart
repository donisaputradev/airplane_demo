import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({super.key, required this.transaction, this.created});
  final Transaction transaction;
  final String? created;

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SmartNetworkImage(
                transaction.destination.image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              Dimens.dp16.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(
                      transaction.destination.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Dimens.dp4.height,
                    RegularText(transaction.destination.city),
                  ],
                ),
              ),
              Dimens.dp16.width,
              const Icon(
                Icons.star_rate_rounded,
                color: AppColors.amber,
              ),
              SubTitleText('${transaction.destination.rating}'),
            ],
          ),
          Dimens.dp20.height,
          const SubTitleText('Booking Details'),
          Dimens.dp8.height,
          TileDetail(
            title: 'Traveler',
            value: '${transaction.amount} Person',
          ),
          TileDetail(
            title: 'Seat',
            value: transaction.selectedSeats,
          ),
          TileDetail(
            title: 'Insurance',
            value: transaction.insurance ? 'YES' : 'NO',
            color: transaction.insurance ? AppColors.teal : AppColors.red,
          ),
          TileDetail(
            title: 'Refundable',
            value: transaction.refundable ? 'YES' : 'NO',
            color: transaction.refundable ? AppColors.teal : AppColors.red,
          ),
          TileDetail(
            title: 'VAT',
            value: '${transaction.vat.toInt()}%',
          ),
          TileDetail(
            title: 'Price',
            value: transaction.price.toIDR(),
          ),
          TileDetail(
            title: 'Grand Total',
            value: transaction.grandTotal.toIDR(),
            color: context.theme.primaryColor,
          ),
          if (created != null) ...[
            Dimens.dp16.height,
            RegularText(DateTime.parse(created!).fullDateTime),
          ]
        ],
      ),
    );
  }
}
