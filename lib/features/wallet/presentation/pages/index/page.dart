import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/wallet/wallet.dart';
import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  static const String routeName = '/wallet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dp32),
          child: Column(
            children: [
              (Dimens.height(context) / 6).height,
              const CardBalance(),
              (Dimens.height(context) / 6).height,
              const HeadingText('Big Bonus 🎉', align: TextAlign.center),
              const RegularText(
                'We give you early credit so that\nyou can buy a flight ticket',
                align: TextAlign.center,
              ),
              (Dimens.height(context) / 12).height,
              ElevatedButton(
                onPressed: () {},
                child: const Text('Start Fly Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
