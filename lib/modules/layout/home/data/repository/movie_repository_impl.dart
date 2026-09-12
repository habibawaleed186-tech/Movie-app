import '../../domain/entity/movie_entity.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasource/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  const MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieEntity>> getMovies() async {
    final movies = await remoteDataSource.getMovies();
    return movies.map<MovieEntity>((movie) => movie).toList();
  }
}
