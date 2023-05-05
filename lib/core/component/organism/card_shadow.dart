import 'package:airplane_demo/core/core.dart';
import 'package:flutter/material.dart';

class CardShadow extends StatelessWidget {
  const CardShadow({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.dp16,
        vertical: Dimens.dp24,
      ),
      decoration: BoxDecoration(
        color: AppColors.gray[100],
        borderRadius: BorderRadius.circular(Dimens.dp18),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: context.theme.shadowColor.withOpacity(.05),
            offset: const Offset(1, 0),
          ),
        ],
      ),
      child: child,
    );
  }
}
