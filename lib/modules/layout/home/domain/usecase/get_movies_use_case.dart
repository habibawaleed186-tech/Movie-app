import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  const GetMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call() async {
    return repository.getMovies();
  }
}
