part of '../page.dart';

class _PaymentSection extends StatelessWidget {
  const _PaymentSection();

  @override
  Widget build(BuildContext context) {
    return CardShadow(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubTitleText('Payment Details'),
          Dimens.dp16.height,
          Row(
            children: [
              CardGradient(
                radius: Dimens.dp18,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      MainAssets.airplaneSvg,
                      width: Dimens.dp24,
                    ),
                    Dimens.dp6.width,
                    SubTitleText(
                      'Pay',
                      style: TextStyle(
                        color: context.theme.scaffoldBackgroundColor,
                      ),
                    ),
                  ],
                ),
              ),
              Dimens.dp16.width,
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingText(
                          (state.user?.balance ?? 0).toIDR(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        Dimens.dp6.height,
                        const RegularText('Current Balance'),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
