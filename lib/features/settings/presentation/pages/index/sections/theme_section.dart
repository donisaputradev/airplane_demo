part of '../page.dart';

class _ThemeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: Dimens.dp32),
            AnimatedToggleSwitch<bool>.dual(
              current: state.theme.name == 'light',
              first: false,
              second: true,
              dif: 8,
              borderColor: Colors.transparent,
              borderWidth: 4,
              height: 37,
              indicatorSize: const Size(Dimens.dp30, Dimens.dp30),
              innerColor: context.theme.primaryColor.withOpacity(.1),
              onChanged: (b) {
                if (b) {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChanged(AppTheme.values[0]));
                } else {
                  BlocProvider.of<ThemeBloc>(context)
                      .add(ThemeChanged(AppTheme.values[1]));
                }
              },
              colorBuilder: (b) => AppColors.primary,
              iconBuilder: (value) => value
                  ? Icon(
                      Icons.nightlight,
                      color: context.theme.primaryColor,
                    )
                  : Icon(
                      Icons.sunny,
                      color: context.theme.primaryColor,
                    ),
              textBuilder: (value) => value
                  ? Icon(
                      Icons.sunny,
                      color: context.theme.primaryColor.withOpacity(.7),
                    )
                  : Icon(
                      Icons.nightlight,
                      color: context.theme.primaryColor.withOpacity(.7),
                    ),
            ),
            const SizedBox(height: Dimens.dp32),
          ],
        );
      },
    );
  }
}
