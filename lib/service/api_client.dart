import 'package:dio/dio.dart';

class DioApiClient implements ApiClient {
  final Dio _dio = Dio();

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response.data;
  }
}

abstract class ApiClient {
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
