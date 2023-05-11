import 'package:airplane_demo/core/core.dart';
import 'package:flutter/material.dart';

class CardShadow extends StatelessWidget {
  const CardShadow({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.onTap,
  });

  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: Dimens.dp16,
              vertical: Dimens.dp24,
            ),
        decoration: BoxDecoration(
          color: context.adaptiveTheme.backgroundColor,
          borderRadius: BorderRadius.circular(Dimens.dp18),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: context.theme.primaryColor.withOpacity(.1),
              offset: const Offset(1, 0),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
