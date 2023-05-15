part of '../page.dart';

class _SkeletonSection extends StatelessWidget {
  const _SkeletonSection();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Dimens.dp16),
      children: [1, 2, 3]
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: Dimens.dp16),
              child: CardShadow(
                child: SkeletonAnimation(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Skeleton(
                            width: Dimens.dp50,
                            height: Dimens.dp50,
                          ),
                          Dimens.dp16.width,
                          Expanded(
                            child: Column(
                              children: [
                                const Skeleton(height: Dimens.dp16),
                                Dimens.dp8.height,
                                const Skeleton(height: Dimens.dp12),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ...[1, 2, 3, 4, 5, 6].map(
                        (e) => Column(
                          children: [
                            Dimens.dp16.height,
                            Row(
                              children: [
                                const Expanded(
                                  child: Skeleton(height: Dimens.dp16),
                                ),
                                Dimens.dp16.width,
                                const Expanded(
                                  child: Skeleton(height: Dimens.dp16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
