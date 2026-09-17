import 'package:movie_app/modules/movie_details/data/data_source/remote_movie_details_data_source.dart';
import 'package:movie_app/modules/movie_details/data/repository_imp/movie_details_imp.dart';
import 'package:movie_app/modules/movie_details/domain/use_case/movie_details_use_case.dart';

import '../../../core/Network/api_interface.dart';
import '../../../core/Network/dio_api_client.dart';
import '../../../core/di/app_di.dart';
import '../data/data_source/movie_similar_data_source_interface.dart';
import '../data/data_source/remote_movie_similar_data_source.dart';
import '../data/repository_imp/movie_similar_imp.dart';
import '../domain/repository/movie_similar_repository.dart';
import '../domain/use_case/movie_similar_use_case.dart';

class MovieDetailsDi {

  static void setUp(){

    getIt
    ..registerLazySingleton(
    ()=>RemoteMovieDetailsDataSource(getIt<DioApiClient>()),
    )
    ..registerLazySingleton(
    ()=> MovieDetailsImp(getIt<RemoteMovieDetailsDataSource>()),
    )
    ..registerLazySingleton(
    ()=> MovieDetailsUseCase(getIt<MovieDetailsImp>())
    )

    ..registerLazySingleton<MovieSimilarDataSourceInterface>(
    () => RemoteMovieSimilarDataSource(getIt<ApiInterface>()),
    )
    ..registerLazySingleton<MovieSimilarRepository>(
    () => MovieSimilarImp(getIt<MovieSimilarDataSourceInterface>()),
    )
    ..registerLazySingleton(
    () => MovieSimilarUseCase(getIt<MovieSimilarRepository>()),
    );

  }
}