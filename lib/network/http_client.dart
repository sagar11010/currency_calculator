import 'package:dio/dio.dart';
import 'api_constants.dart';

///[HttpClient] contain get and post api calls
class HttpClient<T> {
  Future get(url,
      {required Map<String, String> headers,
      required Map<String, dynamic> queryParameters,
      Dio? dio}) async {
    queryParameters['apikey'] = ApiConstants.apiKey;
    Dio _dio = dio ?? Dio();
    final uri = ApiConstants.baseUrl + url;
    try {
      final response = await _dio.get(uri, queryParameters: queryParameters);
      return response.data;
    } on DioError catch (e) {
      throw e.response!.data['message'];
    }
  }
}

enum NetworkState { initial, loading, completed, error }
