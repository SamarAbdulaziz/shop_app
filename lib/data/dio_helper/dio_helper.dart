import 'package:dio/dio.dart';

abstract class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
  // static Future<Response>putDataAPI({
  //   required String url,
  //   Map<String,dynamic>?query,
  //   required  Map<String,dynamic>data,
  //   String lang ='en',
  //   String? token,
  // })async {
  //   dio!.options.headers = {
  //     'Lang': lang,
  //     'Content-Type':'application/json',
  //     'Authorization': token,
  //   };
  //
  //   return await dio!.put(
  //       url,
  //       data: data,
  //       queryParameters: query
  //   );
  // }

}
