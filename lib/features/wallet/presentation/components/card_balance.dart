import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardBalance extends StatefulWidget {
  const CardBalance({
    super.key,
  });

  @override
  State<CardBalance> createState() => _CardBalanceState();
}

class _CardBalanceState extends State<CardBalance> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardGradient(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText(
                          'Name',
                          style: TextStyle(
                            color: context.adaptiveTheme.backgroundColor,
                            fontSize: Dimens.dp12,
                          ),
                        ),
                        Dimens.dp8.width,
                        HeadingText(
                          state.user?.name ?? '-----------',
                          style: TextStyle(
                            color: context.adaptiveTheme.backgroundColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    MainAssets.airplaneSvg,
                    width: Dimens.dp24,
                  ),
                  Dimens.dp8.width,
                  HeadingText(
                    'Pay',
                    style: TextStyle(
                      color: context.adaptiveTheme.backgroundColor,
                    ),
                  ),
                ],
              ),
              Dimens.dp16.height,
              RegularText(
                'Balance',
                style: TextStyle(
                  color: context.adaptiveTheme.backgroundColor,
                ),
              ),
              HeadingText(
                (state.user?.balance ?? 0).toIDR(),
                style: TextStyle(
                  color: context.adaptiveTheme.backgroundColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
