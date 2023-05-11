import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessTransactionPage extends StatelessWidget {
  const SuccessTransactionPage({super.key});

  static const String routeName = '/transaction/success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(MainAssets.successBookSvg),
            (Dimens.height(context) / 10).height,
            const HeadingText(
              'Well Booked 😍',
              align: TextAlign.center,
            ),
            Dimens.dp10.height,
            const RegularText(
              'Are you ready to explore the new\nworld of experiences?',
              align: TextAlign.center,
            ),
            (Dimens.height(context) / 18).height,
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MainPage.routeName,
                  (route) => false,
                );
              },
              child: const Text('My Bookings'),
            ),
          ],
        ),
      ),
    );
  }
}
