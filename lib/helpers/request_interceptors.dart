import 'package:dio/dio.dart';

import '../constants/api_const.dart';
import 'shared_pref.dart';
import 'utils.dart';

//! ========================= Dio Client Setup ===========================
class DioClient {
  final Dio _dio = Dio();
  final RequestInterceptor requestInterceptor = RequestInterceptor();

  DioClient();

  BaseOptions _dioOptions() {
    BaseOptions opts = BaseOptions();
    opts.baseUrl = ApiConst.baseURL;
    opts.connectTimeout = const Duration(minutes: 1);
    opts.receiveTimeout = const Duration(minutes: 1);
    opts.sendTimeout = const Duration(minutes: 1);
    return opts;
  }

  Dio provideDio() {
    _dio.options = _dioOptions();
    _dio.interceptors.add(requestInterceptor);
    return _dio;
  }
}

//! Dio Interceptor Setup
class RequestInterceptor extends Interceptor {
  //* Start of RequestInterceptor class */

  final Dio api = Dio();

  //* ============================ On-Request =====================
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = ApiConst.baseURL;
    //Get saved tokens from local storage
    String savedTokens = SharedPref.bearerToken;
    if (savedTokens.isNotEmpty) {
      options.headers["Authorization"] = 'JWT $savedTokens';
    }
    printError('REQUEST[${options.method}] => ${options.uri}');
    return super.onRequest(options, handler);
  }

  //* ============================ On-Error =====================

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    printError(
        "=== Dio Error Occured ==> ErrorResponse[${err.response?.statusCode}] ===");
    if (err.type == DioExceptionType.badResponse) {
      printError(
          'ErrorResponse[${err.response?.statusCode}] =>${err.response}');
    }
    if (err.type == DioExceptionType.connectionTimeout) {
      printError('check your connection');
    }
    if (err.type == DioExceptionType.receiveTimeout) {
      printError('unable to connect to the server');
    }
    if (err.type == DioExceptionType.unknown) {
      printError('Something went wrong');
    }
    // consider to remap this error to generic error.
    return super.onError(err, handler);
  }

  //* ============================ On-Response =====================

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    printError(
        "=== Dio Success Occured ==> RESPONSE[${response.statusCode}] ===");
    return super.onResponse(response, handler);
  }

  //* End of Interceptor class */
}
