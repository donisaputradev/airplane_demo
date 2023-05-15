import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'sections/skeleton_section.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionBloc>().add(GetTransactionsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction'),
      ),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state.statusList == TransactionStateStatus.success) {
            if (state.transactions.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.dp32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        MainAssets.emptySvg,
                      ),
                      Dimens.dp16.height,
                      const SubTitleText(
                        'Empty Transactions',
                        align: TextAlign.center,
                      ),
                      Dimens.dp16.height,
                      const RegularText(
                        'All transactions will be displayed\non this page',
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return ListView(
                padding: const EdgeInsets.all(Dimens.dp16),
                children: state.transactions
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: Dimens.dp16),
                        child: CardDetail(transaction: e, created: e.created),
                      ),
                    )
                    .toList(),
              );
            }
          } else {
            return const _SkeletonSection();
          }
        },
      ),
    );
  }
}
