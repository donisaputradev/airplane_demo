part of '../page.dart';

class _SliderBoardSection extends StatelessWidget {
  const _SliderBoardSection({
    Key? key,
    this.controller,
    required this.data,
  }) : super(key: key);

  final PageController? controller;
  final List<IntroBoard> data;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return _BoardCardSection(board: data[index]);
      },
      physics: const BouncingScrollPhysics(),
      itemCount: data.length,
    );
  }
}
