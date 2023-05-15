import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/auth/auth.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'sections/route_section.dart';
part 'sections/payment_section.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key, required this.transaction});
  final Transaction transaction;

  static const String routeName = '/transaction/checkout';

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    context.read<TransactionBloc>().add(ResetTransactionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionBloc, TransactionState>(
      listener: (context, trx) {
        if (trx.status == TransactionStateStatus.success) {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, SuccessTransactionPage.routeName);
        } else if (trx.status == TransactionStateStatus.loading) {
          EasyLoading.show(status: 'Loading...');
        } else if (trx.status == TransactionStateStatus.failure) {
          EasyLoading.dismiss();
          EasyLoading.showError(
            trx.failure?.message ?? 'Failed to proccess data!',
          );
        }
      },
      builder: (context, trx) {
        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: [
              const _RouteSection(),
              Dimens.dp32.height,
              CardDetail(transaction: widget.transaction),
              Dimens.dp32.height,
              const _PaymentSection(),
              Dimens.dp32.height,
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state.user!.balance <
                            widget.transaction.grandTotal
                        ? null
                        : () {
                            context.read<TransactionBloc>().add(
                                  CreateTransactionEvent(widget.transaction),
                                );
                          },
                    child: const Text('Pay Now'),
                  );
                },
              ),
              Dimens.dp32.height,
              const RegularText(
                'Terms and Conditions',
                align: TextAlign.center,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ],
          ),
        );
      },
    );
  }
}
