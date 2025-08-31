import 'dart:developer';

import '../../../../model/user.model.dart';
import '../data_provider/user_data.provider.dart';

class UserRepository {
  final UserDataProvider _userDataProvider;

  UserRepository(this._userDataProvider);

  Future<UserModel?> getUserData() async {
    try {
      final response = await _userDataProvider.getUserData();
      log(
        "${response?.data?['me']} Type: ${response?.data?['me'].runtimeType}",
        name: "data from repository",
      );

      final userModel = UserModel.fromJson(response?.data?['me']);
      log(userModel.toString(), name: "data model from repository");
      return userModel;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
