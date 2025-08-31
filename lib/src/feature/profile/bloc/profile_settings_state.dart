part of 'profile_settings_bloc.dart';

sealed class ProfileSettingsState extends Equatable {
  const ProfileSettingsState();

  @override
  List<Object?> get props => [];
}

final class ProfileSettingsInitial extends ProfileSettingsState {}

final class ProfileSettingsLoading extends ProfileSettingsState {}

final class ProfileSettingsData extends ProfileSettingsState {
  final bool? result;

  const ProfileSettingsData(this.result);

  @override
  List<Object?> get props => [result];
}

final class ProfileSettingsError extends ProfileSettingsState {
  final String errorMessage;

  const ProfileSettingsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
