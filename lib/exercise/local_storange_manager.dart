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
    final users = await getUsers();
    users.add(userModel);
    return putUsers(users);
  }

  Future<UserModel> getUser() async {
    final userModelStr = await getString("UserModel");
    return UserModel.fromJson(jsonDecode(userModelStr ?? ""));
  }

  Future<bool> putUsers(List<UserModel> users) async {
    final pref = await _getSharePreference();
    List<String> userListStr =
        users.map((e) => jsonEncode(e.toJson())).toList();
    return pref.setStringList("Users", userListStr);
  }

  Future<List<UserModel>> getUsers() async {
    final pref = await _getSharePreference();
    final users = pref.getStringList("Users");
    return users?.map((e) => UserModel.fromJson(jsonDecode(e))).toList() ?? [];
  }

  Future<bool> removeAll() async {
    final pref = await _getSharePreference();
    return pref.clear();
  }
}
