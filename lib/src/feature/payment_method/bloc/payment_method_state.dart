part of 'payment_method_bloc.dart';

sealed class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object?> get props => [];
}

final class PaymentMethodInitial extends PaymentMethodState {}

final class PaymentMethodLoading extends PaymentMethodState {}

final class UpdatePaymentMethodSuccess extends PaymentMethodState {}

final class UpdatePaymentMethodFailure extends PaymentMethodState {
  final String errorMessage;

  const UpdatePaymentMethodFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class PaymentMethodData extends PaymentMethodState {
  final UserPaymentInfoModel? userPaymentInfoModel;

  const PaymentMethodData({required this.userPaymentInfoModel});

  @override
  List<Object?> get props => [userPaymentInfoModel];
}

final class PaymentMethodError extends PaymentMethodState {
  final String errorMessage;

  const PaymentMethodError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
