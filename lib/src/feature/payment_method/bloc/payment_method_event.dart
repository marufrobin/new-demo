part of 'payment_method_bloc.dart';

sealed class PaymentMethodEvent extends Equatable {
  const PaymentMethodEvent();

  @override
  List<Object?> get props => [];
}

final class PaymentMethodFetchEvent extends PaymentMethodEvent {}

final class UpdatePaymentMethodPatchEvent extends PaymentMethodEvent {
  final String accountHolderName;
  final String bkashNumber;
  final String bankName;
  final String bankBranchName;
  final String bankAccountNumber;
  final String bankRoutingNumber;

  const UpdatePaymentMethodPatchEvent({
    required this.accountHolderName,
    required this.bkashNumber,
    required this.bankName,
    required this.bankBranchName,
    required this.bankAccountNumber,
    required this.bankRoutingNumber,
  });

  @override
  List<Object?> get props => [accountHolderName, bkashNumber, bankName];
}
