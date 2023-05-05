import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/wallet/wallet.dart';
import 'package:flutter/material.dart';

part 'sections/forms_section.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          Dimens.dp24.height,
          const HeadingText('Join us and get\nyour next journey'),
          Dimens.dp24.height,
          const _FormSection(),
          Dimens.dp50.height,
          const RegularText(
            'Terms and Conditions',
            align: TextAlign.center,
          ),
          Dimens.dp32.height,
        ],
      ),
    );
  }
}
