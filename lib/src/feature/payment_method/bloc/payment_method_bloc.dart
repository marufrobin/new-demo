import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/user_payment_info.model.dart';
import '../data/repository/payment_method.repository.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  final PaymentMethodRepository repository;

  PaymentMethodBloc(this.repository) : super(PaymentMethodInitial()) {
    on<PaymentMethodFetchEvent>(_onFetch);
    on<UpdatePaymentMethodPatchEvent>(_onUpdate);
  }

  _onFetch(
    PaymentMethodFetchEvent event,
    Emitter<PaymentMethodState> emit,
  ) async {
    try {
      emit(PaymentMethodLoading());

      final paymentMethod = await repository.getPaymentMethod();
      log(name: "Payment method", "${paymentMethod?.toJson()}");

      emit(PaymentMethodData(userPaymentInfoModel: paymentMethod));
    } catch (e) {
      emit(PaymentMethodError(errorMessage: e.toString()));
    }
  }

  _onUpdate(
    UpdatePaymentMethodPatchEvent event,
    Emitter<PaymentMethodState> emit,
  ) async {
    try {
      emit(PaymentMethodLoading());

      final paymentMethod = UserPaymentInfoModel(
        accountHolderName: event.accountHolderName,
        bkashNumber: event.bkashNumber,
        bankName: event.bankName,
        bankBranchName: event.bankBranchName,
        bankAccountNumber: event.bankAccountNumber,
        bankRoutingNumber: event.bankRoutingNumber,
      );
      log(name: "Payment method", "${paymentMethod.toJson()}");

      final result = await repository.updatePaymentMethod(
        paymentMethod: paymentMethod,
      );

      if (result ?? false) {
        emit(UpdatePaymentMethodSuccess());
      } else {
        emit(
          const UpdatePaymentMethodFailure(
            errorMessage: "Something went wrong",
          ),
        );
      }
    } catch (e) {
      emit(UpdatePaymentMethodFailure(errorMessage: e.toString()));
    }
  }
}
