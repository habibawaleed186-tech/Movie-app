abstract class ApiInterface {

  Future<dynamic> get(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
      });

  Future<dynamic> post(
      String endpoint, {
        Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters,
      });

  Future<dynamic> put(
      String endpoint, {
        Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters,
      });

  Future<dynamic> delete(
      String endpoint, {
        Map<String, dynamic>? queryParameters,
      });

  Future<dynamic> patch(
      String endpoint, {
        Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters,
      });
}
