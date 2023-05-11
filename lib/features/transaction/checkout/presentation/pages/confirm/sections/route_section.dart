part of '../page.dart';

class _RouteSection extends StatelessWidget {
  const _RouteSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dimens.dp32.height,
        SvgPicture.asset(
          MainAssets.routeAirplaneSvg,
        ),
        Dimens.dp16.height,
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  HeadingText('CGK'),
                  RegularText('Tangerang'),
                ],
              ),
            ),
            Dimens.dp16.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  HeadingText(
                    'TLC',
                    align: TextAlign.end,
                  ),
                  RegularText(
                    'Tangerang',
                    align: TextAlign.end,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
