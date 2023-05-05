import 'package:airplane_demo/app/config.dart';
import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            OnboardingPage.routeName,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.indigo,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(MainAssets.airplaneSvg),
              Dimens.dp40.height,
              HeadingText(
                AppConfig.appName.toUpperCase(),
                style: TextStyle(
                  letterSpacing: Dimens.dp8,
                  color: AppColors.gray[100],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
