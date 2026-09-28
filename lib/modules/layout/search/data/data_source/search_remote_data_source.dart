import 'package:dio/dio.dart';

import '../model/movie_model.dart';

class SearchRemoteDataSource {
  static const String _baseUrl = 'https://yts.gg/api/v2/list_movies.json';

  final Dio dio;

  SearchRemoteDataSource({Dio? dio}) : dio = dio ?? Dio();

  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final response = await dio.get(
        _baseUrl,
        queryParameters: {'query_term': query},
      );

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
      throw Exception(error.message ?? 'Something went wrong.');
    } catch (_) {
      throw const FormatException('Failed to parse search results.');
    }
  }
}
