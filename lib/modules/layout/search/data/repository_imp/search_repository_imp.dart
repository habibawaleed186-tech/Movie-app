import '../../domain/entities/movie_entity.dart';
import '../../domain/repository/search_repository.dart';
import '../data_source/search_remote_data_source.dart';

class SearchRepositoryImp implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  const SearchRepositoryImp(this.remoteDataSource);

  @override
  Future<List<MovieEntity>> searchMovies(String query) async {
    final movies = await remoteDataSource.searchMovies(query);

    return movies.map<MovieEntity>((movie) => movie).toList();
  }
}
