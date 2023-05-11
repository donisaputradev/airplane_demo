import 'package:airplane_demo/core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.colorScheme.error,
                ),
                onPressed: () {},
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
