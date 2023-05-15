import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:airplane_demo/features/transaction/seat/seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'sections/detail_section.dart';
part 'sections/title_section.dart';

class DetailPlacePage extends StatelessWidget {
  const DetailPlacePage({super.key, required this.destination});
  final Destination destination;

  static const String routeName = '/place/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SmartNetworkImage(
            destination.image,
            width: double.infinity,
            height: 450,
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
              _TitleSection(destination: destination),
              Dimens.dp30.height,
              _DetailSection(destination: destination),
              Dimens.dp16.height,
              Padding(
                padding: const EdgeInsets.all(Dimens.dp16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingText(
                            destination.price.toIDR(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          const RegularText('per orang'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ChooseSeatPage.routeName,
                            arguments: destination,
                          );
                        },
                        child: const Text(
                          'Book Now',
                          style: TextStyle(fontSize: 14),
                        ),
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
