import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'sections/forms_section.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          Dimens.dp24.height,
          const HeadingText('Sign In with your\nexisting account'),
          Dimens.dp24.height,
          const _FormSection(),
          (Dimens.height(context) / 6).height,
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RegisterPage.routeName,
                (route) => false,
              );
            },
            child: const RegularText(
              'Dont\'t have an account? Sign Up',
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
