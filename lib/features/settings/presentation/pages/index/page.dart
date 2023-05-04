import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showan_coffee/app/routes.dart';
import 'package:showan_coffee/core/core.dart';
import 'package:showan_coffee/features/settings/settings.dart';

part 'sections/header_section.dart';
part 'sections/language_section.dart';
part 'sections/theme_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(Dimens.dp16),
        children: [
          const _HeaderSection(),
          const SizedBox(height: Dimens.dp32),
          _LanguageSection(),
          _ThemeSection(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.auth,
                (route) => false,
              );
            },
            child: const Text('Log Out'),
          ),
          const SizedBox(height: Dimens.dp32),
        ],
      ),
    );
  }
}
