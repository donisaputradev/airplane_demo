part of '../page.dart';

class _InfoSection extends StatelessWidget {
  const _InfoSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              const CardBox(),
              Dimens.dp6.width,
              RegularText.normalSolid(context, 'Available'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const CardBox(
                cardEnum: CardBoxEnum.selected,
              ),
              Dimens.dp6.width,
              RegularText.normalSolid(context, 'Selected'),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const CardBox(
                isBorder: false,
                cardEnum: CardBoxEnum.unavailable,
              ),
              Dimens.dp6.width,
              RegularText.normalSolid(context, 'Unavailable'),
            ],
          ),
        ),
      ],
    );
  }
}
