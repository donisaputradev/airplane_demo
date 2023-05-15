import 'package:airplane_demo/core/core.dart';
import 'package:flutter/material.dart';

enum CardBoxEnum { selected, available, unavailable }

class CardBox extends StatelessWidget {
  const CardBox({
    super.key,
    this.isBorder = true,
    this.isInfo = false,
    this.cardEnum = CardBoxEnum.available,
    this.size,
    this.radius,
  });
  final bool isBorder;
  final bool isInfo;
  final CardBoxEnum cardEnum;
  final double? size;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? Dimens.dp16,
      height: size ?? Dimens.dp16,
      decoration: BoxDecoration(
        color: cardEnum == CardBoxEnum.unavailable
            ? context.theme.disabledColor.withOpacity(.2)
            : cardEnum == CardBoxEnum.available
                ? context.theme.primaryColor.withOpacity(.3)
                : context.theme.primaryColor,
        border: isBorder ? Border.all(color: context.theme.primaryColor) : null,
        borderRadius: BorderRadius.circular(radius ?? Dimens.dp6),
      ),
      child: cardEnum == CardBoxEnum.selected && isInfo == false
          ? Center(
              child: RegularText.mediumSolid(
              context,
              'You',
              style: TextStyle(color: context.theme.scaffoldBackgroundColor),
            ))
          : null,
    );
  }
}
