import '../../../../core/Network/api_results.dart';
import '../../../layout/home/domain/entity/movie_entity.dart';

abstract class MovieSimilarRepository {

  Future<ApiResults<List<MovieEntity>>> getMovieSuggestions(int movieId);
}