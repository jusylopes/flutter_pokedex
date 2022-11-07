import 'package:dio/dio.dart';
import 'package:pokedex/client/client_http.dart';

class DioClientHttp implements ClientHttp {
  final Dio _dio;

  DioClientHttp(this._dio);

  @override
  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}