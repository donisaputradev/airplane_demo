import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: List.generate(
          5,
          (index) => const Padding(
            padding: EdgeInsets.only(bottom: Dimens.dp16),
            child: CardDetail(),
          ),
        ),
      ),
    );
  }
}

// flutterfire config --project=airplanedemo-157e8 --out=lib/firebase_options_stag.dart --ios-bundle-id=com.donisaputra.airplane.stag --android-app-id=com.donisaputra.airplane.stag --macos-bundle-id=com.donisaputra.airplane.stag --web-app-id=com.donisaputra.airplane.stag