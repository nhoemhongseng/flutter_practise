import 'package:dio/dio.dart';
import 'package:test1/excercise2/constant.dart';

class DioClient {
  DioClient._();

  static final instance = DioClient._();

  final Dio _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json));

  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
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
