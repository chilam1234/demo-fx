import 'package:demo_fx_project/service/api_client.dart';

class MockAPIClient extends ApiClient {
  Future<dynamic> Function(
    String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  ) mockGetResult = (url, queryParameters, headers) =>
      throw UnimplementedError('Please provider mock get result');

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await mockGetResult(url, queryParameters, headers);
  }
}
