import 'package:airplane_demo/core/core.dart';
import 'package:flutter/material.dart';

class CardGradient extends StatelessWidget {
  const CardGradient({super.key, required this.child, this.radius});
  final Widget child;
  final double? radius;

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
        borderRadius: BorderRadius.circular(radius ?? Dimens.dp32),
      ),
      child: child,
    );
  }
}
