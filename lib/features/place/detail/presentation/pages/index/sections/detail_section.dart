part of '../page.dart';

class _DetailSection extends StatelessWidget {
  const _DetailSection();

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubTitleText('About'),
          Dimens.dp6.height,
          const RegularText(
            'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
          ),
          Dimens.dp16.height,
          const SubTitleText('Photos'),
          Dimens.dp6.height,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [1, 2, 3, 4, 5]
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: Dimens.dp16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Dimens.dp18),
                        child: Image.network(
                          'https://cdn-brilio-net.akamaized.net/news/2016/04/07/53225/228188-jembatan-indah-1-20.jpg',
                          height: 70,
                          width: 70,
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
            children: [1, 2, 3, 4]
                .map(
                  (e) => Row(
                    children: [
                      SvgPicture.asset(
                        MainAssets.checkIconSvg,
                      ),
                      Dimens.dp6.width,
                      RegularText.mediumSolid(context, 'Kids Park'),
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
