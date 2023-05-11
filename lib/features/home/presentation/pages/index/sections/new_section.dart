part of '../page.dart';

class _NewSection extends StatelessWidget {
  const _NewSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [1, 2, 3, 4, 5]
          .map(
            (e) => CardShadow(
              onTap: () {
                Navigator.pushNamed(context, DetailPlacePage.routeName);
              },
              padding: const EdgeInsets.all(Dimens.dp10),
              margin: const EdgeInsets.symmetric(vertical: Dimens.dp8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.dp18),
                    child: Image.network(
                      'https://awsimages.detik.net.id/community/media/visual/2022/04/30/tipang_169.jpeg',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Dimens.dp16.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SubTitleText(
                          'Danau Toba',
                          style: TextStyle(fontSize: 18),
                        ),
                        RegularText('Singaraja'),
                      ],
                    ),
                  ),
                  Dimens.dp16.width,
                  const Icon(Icons.star_rate_rounded, color: AppColors.amber),
                  Dimens.dp8.width,
                  const SubTitleText('4.5'),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
