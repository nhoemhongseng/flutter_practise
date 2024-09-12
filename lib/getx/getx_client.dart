import 'package:dio/dio.dart';
import 'package:test1/client/log_intercepter.dart';
import 'package:test1/getx/getx_constant.dart';

class GetXClient {
  late Dio _dio;

  GetXClient._() {
    _dio = Dio(BaseOptions(
        baseUrl: GetXConstant.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json))
      ..interceptors.add(LoggerInterceptor());
  }

  static final instance = GetXClient._();

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
