import 'package:movie_app/core/Network/api_results.dart';
import 'package:movie_app/modules/layout/home/domain/entity/movie_entity.dart';

abstract class MovieDetailsRepository {
  Future<ApiResults<MovieEntity>> getMovieDetails(int movieId);
}