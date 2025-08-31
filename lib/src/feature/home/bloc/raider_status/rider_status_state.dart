part of 'rider_status_bloc.dart';

@immutable
sealed class RiderStatusState {
  const RiderStatusState();

  Map<String, dynamic> toMap();

  factory RiderStatusState.fromMap(Map<String, dynamic> map) {
    final status =
        map['status'] == 'online' ? RiderStatus.online : RiderStatus.offline;
    return RiderStatusLoaded(status);
  }
}

final class RiderStatusInitial extends RiderStatusState {
  const RiderStatusInitial();

  @override
  Map<String, dynamic> toMap() => {'status': 'offline'};
}

final class RiderStatusLoaded extends RiderStatusState {
  final RiderStatus status;

  const RiderStatusLoaded(this.status);

  @override
  Map<String, dynamic> toMap() => {'status': status.name};
}

final class RiderStatusError extends RiderStatusState {
  final String errorMessage;

  const RiderStatusError({required this.errorMessage});

  @override
  Map<String, dynamic> toMap() => {'errorMessage': errorMessage};
}
