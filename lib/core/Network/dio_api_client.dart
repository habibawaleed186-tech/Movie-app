import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_interface.dart';
import 'api_logs_interceptors.dart';

class DioApiClient implements ApiInterface {

  final _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseURL,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  DioApiClient() {
    _interceptors();
  }

  void _interceptors() {
    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Do something before request is sent.
          // If you want to resolve the request with custom data,
          // you can resolve a `Response` using `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject with a `DioException` using `handler.reject(dioError)`
          // .
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // Do something with response data.
          // If you want to reject the request with a error message,
          // you can reject a `DioException` object using `handler.reject(dioError)`.
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.

          if (error.response!.statusCode == 401) {
            // Handle unauthorized error, maybe refresh token or redirect to login
          }
          return handler.next(error);
        },
      ),
      ApiLogsInterceptor(),
    ]);
  }

  @override
  Future<dynamic> delete(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.delete(
      endpoint,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<dynamic> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(endpoint, queryParameters: queryParameters);
  }

  @override
  Future<dynamic> patch(String endpoint,
      {Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters}) async {
    return await _dio.patch(
      endpoint,
      data: body,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<dynamic> post(String endpoint,
      {Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters}) async {
    return await _dio.post(
      endpoint,
      data: body,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<dynamic> put(String endpoint,
      {Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters}) async {
    return await _dio.put(
      endpoint,
      data: body,
      queryParameters: queryParameters,
    );
  }
}
