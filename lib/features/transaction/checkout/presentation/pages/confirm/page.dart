import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'sections/route_section.dart';
part 'sections/payment_section.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static const String routeName = '/transaction/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          const _RouteSection(),
          Dimens.dp32.height,
          const CardDetail(),
          Dimens.dp32.height,
          const _PaymentSection(),
          Dimens.dp32.height,
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, SuccessTransactionPage.routeName);
            },
            child: const Text('Pay Now'),
          ),
          Dimens.dp32.height,
          const RegularText(
            'Terms and Conditions',
            align: TextAlign.center,
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
