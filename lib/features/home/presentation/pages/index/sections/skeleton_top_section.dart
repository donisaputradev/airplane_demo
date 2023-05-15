part of '../page.dart';

class _SkeletonTopSection extends StatelessWidget {
  const _SkeletonTopSection();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SkeletonAnimation(
          child: Row(
        children: [1, 2, 3]
            .map(
              (e) => const Padding(
                padding: EdgeInsets.only(
                  right: Dimens.dp16,
                  bottom: Dimens.dp16,
                  top: Dimens.dp16,
                ),
                child: Skeleton(
                  width: 180,
                  height: Dimens.dp300,
                  radius: Dimens.dp16,
                ),
              ),
            )
            .toList(),
      )),
    );
  }
}
