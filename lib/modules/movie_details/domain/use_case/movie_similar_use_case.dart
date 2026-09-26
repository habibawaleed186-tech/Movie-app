import 'package:movie_app/core/Network/api_results.dart';
import 'package:movie_app/modules/movie_details/domain/repository/movie_similar_repository.dart';

import '../../../layout/home/domain/entity/movie_entity.dart';

class MovieSimilarUseCase {

  MovieSimilarRepository repository;
  MovieSimilarUseCase(this.repository);

  Future<ApiResults<List<MovieEntity>>> call(int movieId) async {
    return await repository.getMovieSuggestions(movieId);
  }

}