import 'package:dio/dio.dart';
import 'package:test1/excercise2/constant.dart';
import 'package:test1/excercise2/dio_client.dart';

import 'user.dart';

abstract class UserRepository {
  Future<List<User>> getUserList();
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<List<User>> getUserList() async {
    try {
      final res = await DioClient.instance.get(path: USER_PATH);
      final list = res["data"] as List;
      final userList = list.map((e) => User.fromJson(e)).toList();
      return userList;
    } on DioException catch (e) {
      throw e.message ?? "Opp Something went wrong";
    }
  }
}
