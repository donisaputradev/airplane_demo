import 'package:airplane_demo/core/core.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonAnimation extends StatelessWidget {
  const SkeletonAnimation({
    Key? key,
    this.backgroundColor,
    this.width,
    this.height,
    this.radius,
    this.child,
    this.baseColor,
    this.highlightColor,
  }) : super(key: key);

  final Color? backgroundColor;
  final Color? baseColor;
  final Color? highlightColor;
  final double? width;
  final double? height;
  final double? radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      child: child ??
          Container(
            width: width ?? double.infinity,
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor ??
                  context.theme.disabledColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(radius ?? 4),
            ),
          ),
    );
  }
}
