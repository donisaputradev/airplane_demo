part of '../page.dart';

class _ControllerSection extends StatelessWidget {
  const _ControllerSection({
    Key? key,
    required this.length,
    this.currentIndex = 0,
    this.onNext,
  })  : assert(
          currentIndex < length,
          '`currentIndex` must be less than `length`',
        ),
        super(key: key);

  final int length;
  final int currentIndex;
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: IntrinsicHeight(
        child: Container(
          width: Dimens.width(context),
          alignment: AlignmentDirectional.centerEnd,
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.dp8,
            horizontal: Dimens.dp16,
          ),
          child: Column(
            children: [
              _DotIndicators(length: length, current: currentIndex),
              const SizedBox(height: Dimens.dp16),
              SizedBox(
                width: Dimens.width(context),
                child: ElevatedButton(
                  onPressed: onNext,
                  child: const Text('Next'),
                ),
              ),
              const SizedBox(height: Dimens.dp8),
            ],
          ),
        ),
      ),
    );
  }
}

class _DotIndicators extends StatelessWidget {
  const _DotIndicators({
    Key? key,
    required this.length,
    this.current = 0,
  })  : assert(length > 1, '`length` must be greater than 1'),
        assert(current >= 0, '`current` must be greater than or equal to 0'),
        super(key: key);

  final int length;
  final int current;

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.adaptiveTheme.primaryColor;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < length; i++)
          if (i == current) ...[
            const SizedBox(width: Dimens.dp4),
            DecoratedBox(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(Dimens.dp4),
              ),
              child: const SizedBox(width: Dimens.dp20, height: Dimens.dp8),
            ),
            const SizedBox(width: Dimens.dp4),
          ] else ...[
            const SizedBox(width: Dimens.dp4),
            DecoratedBox(
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(Dimens.dp4),
              ),
              child: const SizedBox(width: Dimens.dp8, height: Dimens.dp8),
            ),
            const SizedBox(width: Dimens.dp4),
          ],
      ],
    );
  }
}
