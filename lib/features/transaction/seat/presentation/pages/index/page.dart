import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:airplane_demo/features/transaction/seat/seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sections/info_section.dart';

class ChooseSeatPage extends StatefulWidget {
  const ChooseSeatPage({super.key, required this.destination});
  final Destination destination;

  static const String routeName = '/choos/seat';

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  @override
  void initState() {
    context.read<SeatBloc>().add(ResetSeatEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeatBloc, SeatState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: [
              Dimens.dp16.height,
              const HeadingText('Select Your\nFavorite Seat'),
              Dimens.dp24.height,
              const _InfoSection(),
              Dimens.dp24.height,
              CardShadow(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ColumnSeat(
                            title: 'A',
                            price: widget.destination.price,
                          ),
                        ),
                        Expanded(
                          child: ColumnSeat(
                            title: 'B',
                            price: widget.destination.price,
                          ),
                        ),
                        Expanded(
                          child: ColumnSeat(
                            title: '',
                            isNumber: true,
                            price: widget.destination.price,
                          ),
                        ),
                        Expanded(
                          child: ColumnSeat(
                            title: 'C',
                            price: widget.destination.price,
                          ),
                        ),
                        Expanded(
                          child: ColumnSeat(
                            title: 'D',
                            price: widget.destination.price,
                          ),
                        ),
                      ],
                    ),
                    Dimens.dp16.height,
                    Row(
                      children: [
                        const RegularText('Your Seat'),
                        Dimens.dp8.width,
                        Expanded(
                          child: SubTitleText(
                            state.selected.join(', '),
                            align: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    Dimens.dp16.height,
                    Row(
                      children: [
                        const RegularText('Total'),
                        Dimens.dp8.width,
                        Expanded(
                          child: SubTitleText(
                            state.price.toIDR(),
                            align: TextAlign.end,
                            style: TextStyle(color: context.theme.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Dimens.dp32.height,
              ElevatedButton(
                onPressed: state.selected.isEmpty
                    ? null
                    : () {
                        Navigator.pushNamed(
                          context,
                          CheckoutPage.routeName,
                          arguments: Transaction(
                            destination: widget.destination,
                            amount: state.selected.length,
                            selectedSeats: state.selected.join(', '),
                            insurance: true,
                            refundable: false,
                            vat: 45,
                            price: state.price,
                            grandTotal:
                                state.price + (state.price * 0.45).toInt(),
                            created: DateTime.now().toIso8601String(),
                          ),
                        );
                      },
                child: const Text('Continue to Checkout'),
              )
            ],
          ),
        );
      },
    );
  }
}
