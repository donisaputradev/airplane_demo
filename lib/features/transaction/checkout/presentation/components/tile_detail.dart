import 'package:airplane_demo/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TileDetail extends StatelessWidget {
  const TileDetail({
    super.key,
    this.color,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.dp12),
      child: Row(
        children: [
          SvgPicture.asset(MainAssets.checkIconSvg),
          Dimens.dp6.width,
          RegularText.normalSolid(context, title),
          Dimens.dp6.width,
          Expanded(
            child: SubTitleText(
              value,
              align: TextAlign.end,
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
