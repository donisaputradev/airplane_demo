import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Dimens.width(context),
        height: Dimens.height(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              MainAssets.backgroundImg,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            (Dimens.height(context) / 1.8).height,
            const HeadingText('Fly Like a Bird', align: TextAlign.center),
            Dimens.dp10.height,
            const RegularText(
              'Explore new world with us and let\nyourself get an amazing experiences',
              align: TextAlign.center,
            ),
            Dimens.dp50.height,
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RegisterPage.routeName,
                  (route) => false,
                );
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
