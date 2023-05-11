part of '../page.dart';

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(
                'Lake Ciliwung',
                style: TextStyle(
                  color: context.adaptiveTheme.backgroundColor,
                ),
              ),
              RegularText(
                'Tangerang',
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
          '4.8',
          style: TextStyle(
            color: context.adaptiveTheme.backgroundColor,
          ),
        ),
      ],
    );
  }
}
