import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/wallet/wallet.dart';
import 'package:flutter/material.dart';

class ShowWalletPage extends StatelessWidget {
  const ShowWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Wallet')),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(Dimens.dp16),
          children: [
            Dimens.dp32.height,
            const CardBalance(),
            Dimens.dp32.height,
          ],
        ),
      ),
    );
  }
}
