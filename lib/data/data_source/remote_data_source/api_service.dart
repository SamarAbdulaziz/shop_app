import 'package:dio/dio.dart';

class ApiService {
  static Dio? _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        //connectTimeout: const Duration(seconds: 5),
      ),
    );
  }

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    _dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return _dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    _dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await _dio!.get(
      url,
      queryParameters: query,
    );
  }

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    _dio!.options.headers = {
      'Lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await _dio!.put(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
