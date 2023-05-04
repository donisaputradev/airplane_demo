part of '../page.dart';

class _LanguageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return ListTile(
          key: const Key('list_tile_settings_select_language'),
          leading: Icon(
            Icons.language,
            color: context.theme.primaryColor,
          ),
          title: Row(
            children: [
              const Text('Languages'),
              const SizedBox(width: Dimens.dp8),
              Image.asset(
                'assets/images/flags/${(state.language?.code ?? 'id')}.png',
                height: Dimens.dp18,
              )
            ],
          ),
          trailing: Icon(
            Icons.chevron_right_rounded,
            color: context.theme.primaryColor,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.dp8)),
          onTap: () =>
              _showDialogSelectLanguage(context, state.supportedLanguages),
        );
      },
    );
  }

  void _showDialogSelectLanguage(
    BuildContext context,
    List<Language> languages,
  ) {
    showDialog<Object?>(
      context: context,
      builder: (_) => SimpleDialog(
        children: languages
            .map(
              (lang) => ListTile(
                title: Text(lang.name),
                trailing: Text(lang.code),
                onTap: () {
                  BlocProvider.of<LanguageBloc>(context)
                      .add(LanguageChanged(lang));
                  Navigator.of(context).pop();
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
