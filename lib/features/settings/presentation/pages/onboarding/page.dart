import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:showan_coffee/core/core.dart';
import 'package:showan_coffee/features/settings/domain/domain.dart';

part 'sections/controller_section.dart';
part 'sections/board_card_section.dart';
part 'sections/slider_board_section.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  final _onboardingData = GetIt.I<GetOnboardingDataUseCase>().call();

  @override
  void initState() {
    _addControllerListener();
    super.initState();
  }

  void _addControllerListener() {
    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _SliderBoardSection(
              controller: _controller,
              data: _onboardingData,
            ),
          ),
          _ControllerSection(
            length: _onboardingData.length,
            currentIndex:
                _controller.hasClients ? _controller.page?.round() ?? 0 : 0,
            onNext: () {
              if ((_controller.page ?? 0) < _onboardingData.length - 1) {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                // GoRouter.of(context).go('/auth');
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller
      ..removeListener(() {})
      ..dispose();
    super.dispose();
  }
}
