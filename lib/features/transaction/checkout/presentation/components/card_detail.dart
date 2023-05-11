import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimens.dp18),
                child: Image.network(
                  'https://cdn-brilio-net.akamaized.net/news/2016/04/07/53225/228188-jembatan-indah-1-20.jpg',
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              Dimens.dp16.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeadingText(
                      'Lake Ciliwung',
                      style: TextStyle(fontSize: 18),
                    ),
                    Dimens.dp4.height,
                    const RegularText('Tangerang'),
                  ],
                ),
              ),
              Dimens.dp16.width,
              const Icon(
                Icons.star_rate_rounded,
                color: AppColors.amber,
              ),
              const SubTitleText('4.8'),
            ],
          ),
          Dimens.dp20.height,
          const SubTitleText('Booking Details'),
          Dimens.dp8.height,
          const TileDetail(
            title: 'Traveler',
            value: '2 Person',
          ),
          const TileDetail(
            title: 'Seat',
            value: 'A3, B3',
          ),
          const TileDetail(
            title: 'Insurance',
            value: 'YES',
            color: AppColors.teal,
          ),
          const TileDetail(
            title: 'Refundable',
            value: 'NO',
            color: AppColors.red,
          ),
          const TileDetail(
            title: 'VAT',
            value: '45%',
          ),
          const TileDetail(
            title: 'Price',
            value: 'IDR 8.500.690',
          ),
          TileDetail(
            title: 'Grand Total',
            value: 'IDR 12.000.000',
            color: context.theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
