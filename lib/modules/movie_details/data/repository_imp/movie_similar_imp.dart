import 'package:dio/dio.dart';
import 'package:movie_app/modules/layout/home/data/model/movie_model.dart';

import '../../../../core/Network/api_results.dart';
import '../../../../core/failures/server_faliuer.dart';
import '../../../layout/home/domain/entity/movie_entity.dart';
import '../../domain/repository/movie_similar_repository.dart';
import '../data_source/movie_similar_data_source_interface.dart';

class MovieSimilarImp implements MovieSimilarRepository{

  MovieSimilarDataSourceInterface _movieSimilarDataSourceInterface;
  MovieSimilarImp(this._movieSimilarDataSourceInterface);


  @override
  Future<ApiResults<List<MovieEntity>>> getMovieSuggestions(int movieId) async {
    try {
      final response = await _movieSimilarDataSourceInterface.getMovieSuggestions(movieId);

      if (response.statusCode == 200) {
        final List list = response.data['data']['movies'] ?? [];

        List<MovieEntity> moviesList = list.map((e) => MovieModel.fromJson(e)).toList();

        return ApiResults.success(data: moviesList);
      } else {
        final exception = ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data['status_message'] ?? 'Error occurred',
        );
        return ApiResults.failure(exception: exception);
      }

    } on DioException catch (error) {
      final exception = ServerFailure(
        statusCode: error.response?.statusCode?.toString() ?? '0',
        message: error.response?.data['status_message'] ?? 'Error occurred',
      );
      return ApiResults.failure(exception: exception);
    }
  }
}

