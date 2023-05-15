part of '../page.dart';

class _TitleSection extends StatelessWidget {
  const _TitleSection({required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(
                destination.name,
                style: TextStyle(
                  color: context.adaptiveTheme.backgroundColor,
                ),
              ),
              RegularText(
                destination.city,
                style: TextStyle(
                  color: context.adaptiveTheme.backgroundColor,
                ),
              ),
            ],
          ),
        ),
        Dimens.dp8.width,
        const Icon(
          Icons.star_rate_rounded,
          color: AppColors.amber,
        ),
        Dimens.dp8.width,
        SubTitleText(
          '${destination.rating}',
          style: TextStyle(
            color: context.adaptiveTheme.backgroundColor,
          ),
        ),
      ],
    );
  }
}
