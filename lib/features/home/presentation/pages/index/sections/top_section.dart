part of '../page.dart';

class _TopSection extends StatelessWidget {
  const _TopSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DestinationBloc, DestinationState>(
      builder: (context, state) {
        if (state.status == DestinationStateStatus.success) {
          final destinations = state.destinationsPop;
          destinations.shuffle();
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: destinations
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: Dimens.dp16),
                      child: CardShadow(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            DetailPlacePage.routeName,
                            arguments: e,
                          );
                        },
                        margin:
                            const EdgeInsets.symmetric(vertical: Dimens.dp30),
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
                                  SmartNetworkImage(
                                    e.image,
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
                                        color: context
                                            .adaptiveTheme.backgroundColor,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft:
                                              Radius.circular(Dimens.dp18),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star_rate_rounded,
                                            color: AppColors.amber,
                                          ),
                                          SubTitleText('${e.rating}')
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Dimens.dp20.height,
                            HeadingText(e.name),
                            Dimens.dp6.height,
                            RegularText(e.city),
                            Dimens.dp10.height,
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        } else {
          return const _SkeletonTopSection();
        }
      },
    );
  }
}
