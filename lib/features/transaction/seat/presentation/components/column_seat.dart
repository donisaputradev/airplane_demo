import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/seat/seat.dart';
import 'package:flutter/material.dart';

class ColumnSeat extends StatelessWidget {
  const ColumnSeat({super.key, required this.title, this.isNumber = false});
  final String title;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isNumber ? Dimens.dp26.box : RegularText(title),
        ...List.generate(
          5,
          (index) => Padding(
            padding: isNumber
                ? const EdgeInsets.symmetric(vertical: Dimens.dp22)
                : const EdgeInsets.only(top: Dimens.dp16),
            child: isNumber
                ? RegularText('${index + 1}')
                : const CardBox(
                    size: Dimens.dp48,
                    radius: Dimens.dp16,
                  ),
          ),
        ),
      ],
    );
  }
}
