part of '../page.dart';

class _SkeletonNewSection extends StatelessWidget {
  const _SkeletonNewSection();

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      child: Column(
        children: [1, 2, 3, 4, 5]
            .map((e) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimens.dp8),
                  child: Skeleton(
                    height: Dimens.dp100,
                    radius: Dimens.dp16,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
