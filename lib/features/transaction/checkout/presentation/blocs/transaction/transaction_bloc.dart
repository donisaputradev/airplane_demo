import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/settings/settings.dart';
import 'package:airplane_demo/features/transaction/checkout/checkout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc({
    required this.createTransactionUseCase,
    required this.getTransactionsUseCase,
  }) : super(TransactionState.initial()) {
    on<CreateTransactionEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: TransactionStateStatus.loading));
        final usecase = await createTransactionUseCase(event.transaction);
        usecase.fold(
          (l) {
            emit(state.copyWith(
              status: TransactionStateStatus.failure,
              failure: l,
            ));
          },
          (r) {
            emit(state.copyWith(status: TransactionStateStatus.success));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    on<ResetTransactionEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: TransactionStateStatus.initial));
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });

    on<GetTransactionsEvent>((event, emit) async {
      try {
        emit(state.copyWith(statusList: TransactionStateStatus.initial));
        final usecase = await getTransactionsUseCase(const NoParams());
        usecase.fold(
          (l) {
            emit(state.copyWith(
              statusList: TransactionStateStatus.failure,
              failure: l,
            ));
          },
          (r) {
            emit(state.copyWith(
              statusList: TransactionStateStatus.success,
              transactions: r,
            ));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });
  }

  final CreateTransactionUseCase createTransactionUseCase;
  final GetTransactionsUseCase getTransactionsUseCase;
}
