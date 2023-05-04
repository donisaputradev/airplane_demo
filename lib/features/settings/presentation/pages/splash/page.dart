import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) {
          // Navigator.pushNamedAndRemoveUntil(
          //     context, AppRoutes.auth, (route) => false);
        }
      },
      child: Scaffold(
        body: Container(
          width: Dimens.width(context),
          height: Dimens.height(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(MainAssets.bgCoffeeImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Hero(
                  tag: MainAssets.splashLogoImg,
                  child: Image.asset(
                    MainAssets.splashLogoImg,
                    width: Dimens.width(context) / 2,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: Dimens.dp32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
