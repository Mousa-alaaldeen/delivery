// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    // BaseOptions baseOptions = BaseOptions(
    //   baseUrl: "http://www.ma511.somee.com/api/",
    //   receiveDataWhenStatusError: true,
    // );
    // dio = Dio(baseOptions);
    // dio.interceptors.add(LogInterceptor(
    //   requestBody: true,
    //   responseBody: true,
    //   request: true,
    //   requestHeader: true,
    //   responseHeader: true,
    //   error: true,
    //   logPrint: print,
    // ));
    dio = Dio(
      BaseOptions(
        baseUrl: "http://www.ma511.somee.com/api/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? qury,
    String lang = 'en',
    String? token,
    Map<String, String>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.get(
      url,
      queryParameters: qury,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? qury,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dio.post(
      url,
      data: data,
      queryParameters: qury,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? qury,
    String lang = 'en',
    String? token,
    Map<String, String>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.put(
      url,
      data: data,
      queryParameters: qury,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? qury,
    String lang = 'en',
    String? token,
    Map<String, String>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.delete(
      url,
      data: data,
      queryParameters: qury,
    );
  }
}
