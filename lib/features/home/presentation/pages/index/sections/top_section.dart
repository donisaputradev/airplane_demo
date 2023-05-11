part of '../page.dart';

class _TopSection extends StatelessWidget {
  const _TopSection();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: Dimens.dp16),
                child: CardShadow(
                  onTap: () {
                    Navigator.pushNamed(context, DetailPlacePage.routeName);
                  },
                  margin: const EdgeInsets.symmetric(vertical: Dimens.dp30),
                  padding: const EdgeInsets.all(Dimens.dp10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(Dimens.dp18),
                          bottomLeft: Radius.circular(Dimens.dp18),
                          bottomRight: Radius.circular(Dimens.dp18),
                        ),
                        child: Stack(
                          children: [
                            Image.network(
                              'https://awsimages.detik.net.id/community/media/visual/2022/04/30/tipang_169.jpeg',
                              width: 180,
                              height: 220,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: Dimens.dp6,
                                  bottom: Dimens.dp6,
                                ),
                                decoration: BoxDecoration(
                                  color: context.adaptiveTheme.backgroundColor,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(Dimens.dp18),
                                  ),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: AppColors.amber,
                                    ),
                                    SubTitleText('4.5')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Dimens.dp20.height,
                      const HeadingText('Lake Ciliwung'),
                      Dimens.dp6.height,
                      const RegularText('Tangerang'),
                      Dimens.dp10.height,
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
