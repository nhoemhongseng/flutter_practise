import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/exercise/user_model.dart';

class LocalStorageManager {
  static LocalStorageManager get instance => LocalStorageManager._internal();

  LocalStorageManager._internal();

  Future<SharedPreferences> _getSharePreference() async =>
      await SharedPreferences.getInstance();

  Future<bool> putString({required String key, required String value}) async {
    final pref = await _getSharePreference();
    return pref.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final pref = await _getSharePreference();
    return pref.getString(key);
  }

  Future<bool> putUser(UserModel userModel) async {
    return putString(key: "UserModel", value: jsonEncode(userModel.toJson()));
  }

  Future<UserModel> getUser() async {
    final userModelStr = await getString("UserModel");
    return UserModel.fromJson(jsonDecode(userModelStr ?? ""));
  }
}
