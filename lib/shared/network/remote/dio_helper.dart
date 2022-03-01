import 'package:dio/dio.dart';

import '../../components/constants.dart';
import '../end_points.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    Options? options,
  }) async {

    return await dio.get(
      url,
      queryParameters: query,
      options: options,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
    Options? options,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type' : 'application/json',
      'lang' : Constants.lang,
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: data,
      options: options,
    );
  }
  static Future<Response> postFormData({
    required String url,
    required FormData formData,
    Map<String, dynamic>? query,
    String? token,
    Options? options,
  }) async
  {
    dio.options.headers =
    {
      'lang' : Constants.lang,
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: formData,
      options: options,
    );
  }
  /// Put Data Function
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type' : 'application/json',
      'lang':Constants.lang,
    };
    return dio.put(
      url,
      data: (data)!,
      queryParameters: query,
    );
  }
  /// Delete data function
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers =
    {
      'Content-Type' : 'application/json',
      'lang': Constants.lang,
    };

    return dio.delete(
      url,
      data: data,
      queryParameters: query,
    );
  }
}