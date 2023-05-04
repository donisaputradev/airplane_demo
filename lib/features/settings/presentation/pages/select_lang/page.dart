import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showan_coffee/core/core.dart';
import 'package:showan_coffee/features/settings/settings.dart';

part 'sections/action_section.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({Key? key}) : super(key: key);

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LanguageBloc, LanguageState>(
      listener: (context, state) {
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Languages'),
        ),
        body: SafeArea(
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return ListView.separated(
                padding: const EdgeInsets.all(Dimens.dp16),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return LanguageCard(
                    country: state.supportedLanguages[i].name,
                    image:
                        'assets/images/flags/${state.supportedLanguages[i].code}.png',
                    isActive: state.supportedLanguages[i].code ==
                        state.language?.code,
                    onPressed: () {
                      BlocProvider.of<LanguageBloc>(context)
                          .add(LanguageChanged(state.supportedLanguages[i]));
                    },
                  );
                },
                separatorBuilder: (_, __) =>
                    const SizedBox(height: Dimens.dp12),
                itemCount: state.supportedLanguages.length,
              );
            },
          ),
        ),
        bottomNavigationBar: const _ActionsSection(),
      ),
    );
  }
}
