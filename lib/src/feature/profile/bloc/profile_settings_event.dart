part of 'profile_settings_bloc.dart';

sealed class ProfileSettingsEvent extends Equatable {
  const ProfileSettingsEvent();

  @override
  List<Object?> get props => [];
}

final class ProfileSettingsUpdateMeMutationEvent extends ProfileSettingsEvent {
  final String? name;
  final String? phoneNumber;
  final String? city;
  final String? address;
  final String? profileImage;

  const ProfileSettingsUpdateMeMutationEvent({
    this.name,
    this.phoneNumber,
    this.city,
    this.address,
    this.profileImage,
  });

  @override
  List<Object?> get props => [name, phoneNumber, city, address, profileImage];
}
