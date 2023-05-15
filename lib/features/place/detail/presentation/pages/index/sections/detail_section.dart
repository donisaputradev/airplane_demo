part of '../page.dart';

class _DetailSection extends StatelessWidget {
  const _DetailSection({required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubTitleText('About'),
          Dimens.dp6.height,
          RegularText(destination.about),
          Dimens.dp16.height,
          const SubTitleText('Photos'),
          Dimens.dp6.height,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: destination.photos
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: Dimens.dp16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Dimens.dp18),
                        child: SmartNetworkImage(
                          e,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Dimens.dp16.height,
          const SubTitleText('Interests'),
          Dimens.dp6.height,
          GridView.count(
            padding: EdgeInsets.zero,
            crossAxisCount: 2,
            childAspectRatio: 11 / 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: destination.interests
                .map(
                  (e) => Row(
                    children: [
                      SvgPicture.asset(
                        MainAssets.checkIconSvg,
                      ),
                      Dimens.dp6.width,
                      RegularText.mediumSolid(context, e),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
