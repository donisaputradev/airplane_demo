import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/seat/seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'sections/detail_section.dart';
part 'sections/title_section.dart';

class DetailPlacePage extends StatelessWidget {
  const DetailPlacePage({super.key});

  static const String routeName = '/place/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            'https://cdn-brilio-net.akamaized.net/news/2016/04/07/53225/228188-jembatan-indah-1-20.jpg',
            height: 450,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  context.theme.shadowColor,
                ],
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: [
              Dimens.dp300.height,
              const _TitleSection(),
              Dimens.dp30.height,
              const _DetailSection(),
              Dimens.dp16.height,
              Padding(
                padding: const EdgeInsets.all(Dimens.dp16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          HeadingText(
                            'IDR 2.500.000',
                            style: TextStyle(fontSize: 18),
                          ),
                          RegularText('per orang'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ChooseSeatPage.routeName,
                          );
                        },
                        child: const Text('Book Now'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
