import 'package:movie_app/core/di/app_di.dart';

import '../data/data_source/movies_remote_data_source.dart';
import '../data/repository_impl/movies_repository_impl.dart';
import '../domain/repository/movies_repository.dart';
import '../domain/use_cases/get_movies_by_genre_use_case.dart';

class BrowseDi {
  static void setUp() {
    getIt
      ..registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSource(),
      )
      ..registerLazySingleton<MoviesRepository>(
        () => MoviesRepositoryImpl(getIt<MoviesRemoteDataSource>()),
      )
      ..registerLazySingleton<GetMoviesByGenreUseCase>(
        () => GetMoviesByGenreUseCase(getIt<MoviesRepository>()),
      );
  }
}