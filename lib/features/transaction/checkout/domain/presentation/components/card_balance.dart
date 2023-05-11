import 'package:airplane_demo/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardBalance extends StatelessWidget {
  const CardBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.dp24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AppColors.indigo,
            AppColors.indigo[700]!,
            AppColors.indigo,
          ],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: context.theme.shadowColor.withOpacity(.1),
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(Dimens.dp32),
      ),
      child: Column(
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
                      'Kennie',
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
            'IDR 280.000.000',
            style: TextStyle(
              color: context.adaptiveTheme.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
