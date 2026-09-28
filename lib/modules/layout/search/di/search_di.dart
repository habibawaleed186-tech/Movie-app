import 'package:movie_app/core/di/app_di.dart';

import '../data/data_source/search_remote_data_source.dart';
import '../data/repository_imp/search_repository_imp.dart';
import '../domain/repository/search_repository.dart';
import '../domain/use_case/search_movies_use_case.dart';
import '../presentation/manager/search_bloc.dart';

class SearchDi {
  static void setUp() {
    getIt
      ..registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSource(),
      )
      ..registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImp(getIt<SearchRemoteDataSource>()),
      )
      ..registerLazySingleton<SearchUseCase>(
        () => SearchUseCase(getIt<SearchRepository>()),
      )
      ..registerFactory<SearchBloc>(() => SearchBloc(getIt<SearchUseCase>()));
  }
}
