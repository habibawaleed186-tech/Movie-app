import 'package:movie_app/modules/movie_details/data/data_source/remote_movie_details_data_source.dart';
import 'package:movie_app/modules/movie_details/data/repository_imp/movie_details_imp.dart';
import 'package:movie_app/modules/movie_details/domain/use_case/movie_details_use_case.dart';

import '../../../core/Network/dio_api_client.dart';
import '../../../core/di/app_di.dart';

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
    );



  }
}