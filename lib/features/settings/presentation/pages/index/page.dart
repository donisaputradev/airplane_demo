import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'sections/profile_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Dimens.dp250,
            color: context.theme.primaryColor,
          ),
          ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: [
              Dimens.dp32.height,
              HeadingText(
                'My Profile',
                style: TextStyle(color: context.adaptiveTheme.backgroundColor),
              ),
              Dimens.dp42.height,
              const _ProfileSection(),
              (Dimens.height(context) / 8).height,
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state.status == AuthStateStatus.failure) {
                    EasyLoading.dismiss();
                    EasyLoading.showToast(
                      state.failure?.message ?? 'Load data failed!',
                    );
                  } else if (state.status == AuthStateStatus.loading) {
                    EasyLoading.show(status: 'Loading...');
                  } else if (state.status == AuthStateStatus.unauthorized) {
                    EasyLoading.dismiss();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RegisterPage.routeName,
                      (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.colorScheme.error,
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(SignOutEvent());
                    },
                    child: const Text('Sign Out'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
