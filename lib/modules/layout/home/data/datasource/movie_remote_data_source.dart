import 'package:dio/dio.dart';

import '../model/movie_model.dart';

class MovieRemoteDataSource {
  static const String _baseUrl = 'https://yts.gg/api/v2/list_movies.json';

  final Dio dio;

  MovieRemoteDataSource({Dio? dio}) : dio = dio ?? Dio();

  Future<List<MovieModel>> getMovies() async {
    try {
      final response = await dio.get(_baseUrl);
      final payload = response.data;

      if (payload is! Map<String, dynamic>) {
        return const [];
      }

      final moviesJson = payload['data']?['movies'];
      if (moviesJson is! List) {
        return const [];
      }

      return moviesJson
          .whereType<Map>()
          .map((movie) => MovieModel.fromJson(Map<String, dynamic>.from(movie)))
          .toList();
    } on DioException catch (error) {
      throw Exception(_mapDioError(error));
    } catch (_) {
      throw const FormatException('Failed to parse movie list.');
    }
  }

  String _mapDioError(DioException error) {
    if (error.response != null && error.response?.data is Map) {
      final data = error.response!.data as Map;
      final message = data['status_message'] ?? data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
    }

    if (error.message != null && error.message!.isNotEmpty) {
      return error.message!;
    }

    return 'Something went wrong while loading movies.';
  }
}
