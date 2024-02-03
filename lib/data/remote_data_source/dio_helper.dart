import 'package:dio/dio.dart';

abstract class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        //connectTimeout: Duration(seconds: 5),
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return dio!
        .post(
      url,
      queryParameters: query,
      data: data,
    )
        .catchError((e) {
      if (e is DioException) {
        print('error');
        print(e.response?.data.toString());
        return e.response;
      }
    });
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await dio!
        .get(
      url,
      queryParameters: query,
    )
        .catchError((e) {
      if (e is DioException) {
        print('*********************error******************');
        print(e.message.toString());
        print(e.error.toString());
        print(e.response.toString());
        return e.response;
      }
    });
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await dio!
        .put(url, data: data, queryParameters: query)
        .catchError((e) {
      if (e is DioException) {
        print('error');
        print(e.response?.data.toString());
        return e.response;
      }
    });
  }
}