part of '../page.dart';

class _NewSection extends StatelessWidget {
  const _NewSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DestinationBloc, DestinationState>(
      builder: (context, state) {
        if (state.status == DestinationStateStatus.success) {
          final destinations = state.destinations;
          destinations.shuffle();
          return Column(
            children: destinations
                .map(
                  (e) => CardShadow(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailPlacePage.routeName,
                        arguments: e,
                      );
                    },
                    padding: const EdgeInsets.all(Dimens.dp10),
                    margin: const EdgeInsets.symmetric(vertical: Dimens.dp8),
                    child: Row(
                      children: [
                        SmartNetworkImage(
                          e.image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        Dimens.dp16.width,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SubTitleText(
                                e.name,
                                style: const TextStyle(fontSize: 18),
                              ),
                              RegularText(e.city),
                            ],
                          ),
                        ),
                        Dimens.dp16.width,
                        const Icon(Icons.star_rate_rounded,
                            color: AppColors.amber),
                        Dimens.dp8.width,
                        SubTitleText('${e.rating}'),
                      ],
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return const _SkeletonNewSection();
        }
      },
    );
  }
}
