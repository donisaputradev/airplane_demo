import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:airplane_demo/features/transaction/seat/seat.dart';
import 'package:flutter/material.dart';

part 'sections/info_section.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({super.key});

  static const String routeName = '/choos/seat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          Dimens.dp16.height,
          const HeadingText('Select Your\nFavorite Seat'),
          Dimens.dp24.height,
          const _InfoSection(),
          Dimens.dp24.height,
          CardShadow(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(child: ColumnSeat(title: 'A')),
                    Expanded(child: ColumnSeat(title: 'B')),
                    Expanded(child: ColumnSeat(title: 'B', isNumber: true)),
                    Expanded(child: ColumnSeat(title: 'C')),
                    Expanded(child: ColumnSeat(title: 'D')),
                  ],
                ),
                Dimens.dp16.height,
                Row(
                  children: [
                    const RegularText('Your Seat'),
                    Dimens.dp8.width,
                    const Expanded(
                      child: SubTitleText(
                        'A3, B3',
                        align: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                Dimens.dp16.height,
                Row(
                  children: [
                    const RegularText('Total'),
                    Dimens.dp8.width,
                    Expanded(
                      child: SubTitleText(
                        'IDR 540.000.000',
                        align: TextAlign.end,
                        style: TextStyle(color: context.theme.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Dimens.dp32.height,
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, CheckoutPage.routeName);
            },
            child: const Text('Continue to Checkout'),
          )
        ],
      ),
    );
  }
}
