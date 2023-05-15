import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/home/home.dart';
import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:airplane_demo/features/transaction/seat/seat.dart';
import 'package:airplane_demo/features/wallet/wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardingPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnboardingPage(),
        settings: settings,
      );
    case RegisterPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => const RegisterPage(),
        settings: settings,
      );
    case LoginPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => const LoginPage(),
        settings: settings,
      );
    case WalletPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => const WalletPage(),
        settings: settings,
      );
    case MainPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const MainPage(),
        settings: settings,
      );
    case DetailPlacePage.routeName:
      return CupertinoPageRoute(
        builder: (_) => DetailPlacePage(
          destination: settings.arguments as Destination,
        ),
        settings: settings,
      );
    case ChooseSeatPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => ChooseSeatPage(
          destination: settings.arguments as Destination,
        ),
        settings: settings,
      );
    case CheckoutPage.routeName:
      return CupertinoPageRoute(
        builder: (_) => CheckoutPage(
          transaction: settings.arguments as Transaction,
        ),
        settings: settings,
      );
    case SuccessTransactionPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const SuccessTransactionPage(),
        settings: settings,
      );
    default:
      return CupertinoPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Page not found :('),
          ),
        );
      });
  }
}
