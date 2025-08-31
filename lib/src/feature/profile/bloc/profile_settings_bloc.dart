import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/file_uploading_downloading_service.dart';
import '../data/repository/profile_settings.repository.dart';

part 'profile_settings_event.dart';
part 'profile_settings_state.dart';

class ProfileSettingsBloc
    extends Bloc<ProfileSettingsEvent, ProfileSettingsState> {
  final ProfileSettingsRepository profileSettingsRepository;

  ProfileSettingsBloc(this.profileSettingsRepository)
    : super(ProfileSettingsInitial()) {
    on<ProfileSettingsUpdateMeMutationEvent>(_onUpdateMeMutation);
  }

  _onUpdateMeMutation(
    ProfileSettingsUpdateMeMutationEvent event,
    Emitter<ProfileSettingsState> emit,
  ) async {
    try {
      emit(ProfileSettingsLoading());

      String? profileImageKey;

      if (event.profileImage != null) {
        log(event.profileImage!, name: "profileImage");
        await AppFileUploadAndDownloadService.uploadFile(
          filePath: event.profileImage!,
          onProgress: (value) => log(value.toString(), name: "progress"),
          onUploadComplete: (isComplete, {key}) {
            if (isComplete) profileImageKey = key;
          },
        );
      }

      final data = await profileSettingsRepository.updateProfileSettings(
        name: event.name,
        phoneNumber: event.phoneNumber,
        city: event.city,
        address: event.address,
        profileImageKey: profileImageKey,
      );

      if (data == null) {
        emit(const ProfileSettingsError(errorMessage: "Something went wrong"));
        return;
      }

      emit(ProfileSettingsData(data));
    } catch (e) {
      emit(ProfileSettingsError(errorMessage: e.toString()));
    }
  }
}
