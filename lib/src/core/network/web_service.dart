import 'package:dio/dio.dart';
import 'package:mvvm_provider_ny_times_app/src/core/network/dio_network.dart';
import 'package:mvvm_provider_ny_times_app/src/core/network/error/exceptions.dart';

/// Common API Service Utilizing DioNetwork
class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  final Dio _dio = DioNetwork();

  ApiService._internal();

  /// GET Request
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
    throw ServerException("Unknown error", null);
  }

  /// POST Request
  Future<Response> post(String endpoint,
      {dynamic data, Options? options, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
    throw ServerException("Unknown error", null);
  }

  /// PUT Request
  Future<Response> put(String endpoint,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
    throw ServerException("Unknown error", null);
  }

  /// DELETE Request
  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.delete(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
    throw ServerException("Unknown error", null);
  }

  /// Handle Dio Exceptions
  void _handleDioError(DioException e) {
    if (e.type == DioExceptionType.cancel) {
      throw CancelTokenException(
          e.message ?? "Request Cancelled", e.response?.statusCode);
    } else {
      throw ServerException(e.message ?? "Server Error", e.response?.statusCode);
    }
  }
}
