part of '../page.dart';

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(Dimens.dp2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.secondary),
                ),
                child: CircleAvatar(
                  radius: Dimens.dp50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.dp100),
                    child: Image.network(
                      'https://avatars.githubusercontent.com/u/94351550?v=4',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: Dimens.width(context) / 1.9,
              bottom: 0,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(Dimens.dp100),
                child: Container(
                  padding: const EdgeInsets.all(Dimens.dp4),
                  decoration: BoxDecoration(
                    color: context.theme.scaffoldBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: AppColors.amber[700],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: Dimens.dp16),
        const SubTitleText(
          'Doni Mulya Syahputra',
          style: TextStyle(fontSize: Dimens.dp18),
        ),
        const SubTitleText('donisyahputra21.cs@gmail.com'),
        const SizedBox(height: Dimens.dp16),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Edit Profile'),
        ),
      ],
    );
  }
}
