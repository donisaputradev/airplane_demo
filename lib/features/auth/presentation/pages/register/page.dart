import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginPage.routeName,
                (route) => false,
              );
            },
            child: const RegularText(
              'Have an account? Sign In',
              align: TextAlign.center,
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
          Dimens.dp32.height,
        ],
      ),
    );
  }
}
