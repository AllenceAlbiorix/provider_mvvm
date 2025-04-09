import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider_ny_times_app/src/core/network/logger_interceptor.dart';
import 'package:mvvm_provider_ny_times_app/src/core/utils/constant/network_constant.dart';
import 'package:mvvm_provider_ny_times_app/src/core/helper/helper.dart';
import 'package:mvvm_provider_ny_times_app/src/core/utils/log/app_logger.dart';

class DioNetwork with DioMixin implements Dio {
  DioNetwork() {
    this.httpClientAdapter = HttpClientAdapter();
    this.options = baseOptions(apiUrl);
    this.interceptors.add(loggerInterceptor());
    this.interceptors.add(appQueuedInterceptorsWrapper());
  }

  static LoggerInterceptor loggerInterceptor() {
    return LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    );
  }

  ///__________App__________///

  /// App Api Queued Interceptor
  QueuedInterceptorsWrapper appQueuedInterceptorsWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {
        Map<String, dynamic> headers = await _getHeaders();

        if (kDebugMode) {
          print("Headers");
          print(json.encode(headers));
        }
        options.headers = headers;
        this.options.headers = headers;
        return r.next(options);
      },
      onError: (error, handler) async {
        try {
          return handler.next(error);
        } catch (e) {
          return handler.reject(error);
          // onUnexpectedError(handler, error);
        }
      },
      onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) async {
        return handler.next(response);
      },
    );
  }

  static Future<Map<String, dynamic>> _getHeaders() async {
    final String? token = '';
    return {
      'Authorization': token != null ? 'Bearer $token' : '',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static BaseOptions baseOptions(String url) {
    Map<String, dynamic> headers = Helper.getHeaders();

    return BaseOptions(
        baseUrl: url,
        validateStatus: (s) {
          return s! < 300;
        },
        headers: headers..removeWhere((key, value) => value == null),
        responseType: ResponseType.json);
  }
}
