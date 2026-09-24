import 'package:dio/dio.dart';

import '../model/movie_model.dart';

class MoviesRemoteDataSource {
  static const String _baseUrl = 'https://yts.gg/api/v2/list_movies.json';

  final Dio dio;

  MoviesRemoteDataSource({Dio? dio}) : dio = dio ?? Dio();

  Future<List<MovieModel>> getMoviesByGenre(
    String genre, {
    int limit = 20,
  }) async {
    try {
      final response = await dio.get(
        _baseUrl,
        queryParameters: <String, dynamic>{
          'genre': genre,
          'limit': limit,
          'sort_by': 'rating',
          'order_by': 'desc',
        },
      );

      final payload = response.data;
      if (payload is! Map) {
        return const [];
      }

      final data = payload['data'];
      final moviesJson = data is Map ? data['movies'] : null;

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
      throw const FormatException('Failed to parse movies list.');
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