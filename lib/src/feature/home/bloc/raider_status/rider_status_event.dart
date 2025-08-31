part of 'rider_status_bloc.dart';

@immutable
sealed class RaiderStatusEvent {}

final class GoOnline extends RaiderStatusEvent {}

final class GoOffline extends RaiderStatusEvent {}

final class RiderStatusHydrated extends RaiderStatusEvent {}
