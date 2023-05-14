import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sections/top_section.dart';
part 'sections/new_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: [
              Dimens.dp16.height,
              Row(
                children: [
                  Expanded(
                    child: HeadingText(
                      'Howdy,\n${state.user?.name ?? '---------'}',
                    ),
                  ),
                  Dimens.dp8.height,
                  const CircleAvatar(),
                ],
              ),
              Dimens.dp8.height,
              const RegularText('Where to fly today?'),
              const _TopSection(),
              const HeadingText('New This Year'),
              Dimens.dp8.height,
              const _NewSection(),
            ],
          ),
        );
      },
    );
  }
}
