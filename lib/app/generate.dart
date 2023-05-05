import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/home/home.dart';
import 'package:airplane_demo/features/settings/settings.dart';
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
    case MainPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const MainPage(),
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
