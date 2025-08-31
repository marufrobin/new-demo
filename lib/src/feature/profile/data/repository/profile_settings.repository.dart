import '../data_provider/profile_settings_data.provider.dart';

class ProfileSettingsRepository {
  final ProfileSettingsDataProvider _profileSettingsDataProvider;

  ProfileSettingsRepository(this._profileSettingsDataProvider);

  Future<bool?> updateProfileSettings({
    required String? name,
    required String? phoneNumber,
    required String? city,
    required String? address,
    required String? profileImageKey,
  }) async {
    try {
      final response = await _profileSettingsDataProvider.updateProfileSettings(
        name: name,
        phoneNumber: phoneNumber,
        city: city,
        address: address,
        profileImageKey: profileImageKey,
      );
      if (response?.hasException ?? true) {
        throw Exception(response?.exception.toString());
      }
      return response?.data?["updateMe"];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
