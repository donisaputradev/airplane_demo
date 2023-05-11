part of '../page.dart';

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CardShadow(
          margin: const EdgeInsets.only(top: Dimens.dp50),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Dimens.dp50.height,
                  const SubTitleText(
                    'Doni Mulya Syahputra',
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(CupertinoIcons.creditcard),
                      Dimens.dp8.width,
                      const RegularText('IDR 2.5000.000'),
                    ],
                  ),
                ],
              ),
              Dimens.dp16.height,
              const RegularText('Email'),
              const SubTitleText(
                'test@gmail.com',
                style: TextStyle(fontSize: 18),
              ),
              Dimens.dp16.height,
              const RegularText('Hoby'),
              const SubTitleText(
                'Coding',
                style: TextStyle(fontSize: 18),
              ),
              Dimens.dp16.height,
              const RegularText('Joined'),
              const SubTitleText(
                '24 Jan 2023',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        const Positioned(
          right: 0,
          left: 0,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            minRadius: Dimens.dp50,
          ),
        ),
      ],
    );
  }
}
