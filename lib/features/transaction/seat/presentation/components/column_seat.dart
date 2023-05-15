import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/seat/seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColumnSeat extends StatelessWidget {
  const ColumnSeat({
    super.key,
    required this.title,
    this.isNumber = false,
    required this.price,
  });
  final String title;
  final bool isNumber;
  final int price;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeatBloc, SeatState>(
      builder: (context, state) {
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
                    : InkWell(
                        onTap: () {
                          final item = '$title${index + 1}';
                          if (state.selected
                              .where((element) => element.contains(item))
                              .toList()
                              .isEmpty) {
                            context
                                .read<SeatBloc>()
                                .add(AddSelectedEvent(item, price));
                          } else {
                            context
                                .read<SeatBloc>()
                                .add(RemoveSelectedEvent(item, price));
                          }
                        },
                        child: CardBox(
                          size: Dimens.dp48,
                          radius: Dimens.dp16,
                          cardEnum: state.selected
                                  .where(
                                    (element) =>
                                        element.contains('$title${index + 1}'),
                                  )
                                  .toList()
                                  .isEmpty
                              ? CardBoxEnum.available
                              : CardBoxEnum.selected,
                        ),
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
