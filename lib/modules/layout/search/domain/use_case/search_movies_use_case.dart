import '../entities/movie_entity.dart';
import '../repository/search_repository.dart';

class SearchUseCase {
  final SearchRepository repository;

  const SearchUseCase(this.repository);

  Future<List<MovieEntity>> call(String query) {
    return repository.searchMovies(query);
  }
}
