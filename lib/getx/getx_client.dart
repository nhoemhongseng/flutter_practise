import 'package:dio/dio.dart';
import 'package:test1/getx/getx_constant.dart';

class GetXClient {
  GetXClient._();

  static final instance = GetXClient._();

  final Dio _dio = Dio(BaseOptions(
      baseUrl: GetXConstant.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json));

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final res = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (res.statusCode == 200) {
        return res.data;
      }
      throw ("Opp Something went wrong");
    } catch (e) {
      rethrow;
    }
  }
}
