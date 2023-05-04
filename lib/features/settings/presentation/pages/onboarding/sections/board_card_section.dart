part of '../page.dart';

class _BoardCardSection extends StatelessWidget {
  const _BoardCardSection({Key? key, required this.board}) : super(key: key);

  final IntroBoard board;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimens.dp16,
          right: Dimens.dp16,
          top: Dimens.dp24,
          bottom: Dimens.height(context) * .08,
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                board.imageAsset,
                width: Dimens.width(context),
                fit: BoxFit.contain,
              ),
            ),
            TitleText(
              board.title,
              align: TextAlign.center,
            ),
            const SizedBox(height: Dimens.dp6),
            Text(
              board.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: Dimens.dp14),
            ),
          ],
        ),
      ),
    );
  }
}
