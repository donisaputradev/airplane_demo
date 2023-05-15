part of '../page.dart';

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return CardShadow(
              margin: const EdgeInsets.only(top: Dimens.dp50),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Dimens.dp50.height,
                      SubTitleText(
                        state.user?.name ?? '--------',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(CupertinoIcons.creditcard),
                          Dimens.dp8.width,
                          RegularText.mediumSolid(
                            context,
                            (state.user?.balance ?? 0).toIDR(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Dimens.dp16.height,
                  const RegularText('Email'),
                  SubTitleText(
                    state.user?.email ?? '------',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Dimens.dp16.height,
                  const RegularText('Hoby'),
                  SubTitleText(
                    state.user!.hobby.isNotEmpty
                        ? state.user!.hobby
                        : 'No Hobby',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Dimens.dp16.height,
                  const RegularText('Joined'),
                  SubTitleText(
                    DateTime.parse(state.user!.joined).fullDateTime,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          },
        ),
        Positioned(
          right: 0,
          left: 0,
          child: CircleAvatar(
            radius: 55,
            child: SmartNetworkImage(
              AppConfig.profileUrl,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(Dimens.dp100),
            ),
          ),
        ),
      ],
    );
  }
}
