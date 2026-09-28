import 'package:dio/dio.dart';
import 'package:movie_app/core/Network/api_results.dart';
import 'package:movie_app/modules/layout/home/domain/entity/movie_entity.dart';
import 'package:movie_app/modules/movie_details/data/data_source/movie_details_data_source_interface.dart';
import 'package:movie_app/modules/movie_details/domain/repository/movie_details_repository.dart';

import '../../../../core/failures/server_faliuer.dart';
import '../../../layout/home/data/model/movie_model.dart';

class MovieDetailsImp implements MovieDetailsRepository{
  final MovieDetailsDataSourceInterface _movieDetailsDataSourceInterface;
  MovieDetailsImp(this._movieDetailsDataSourceInterface);

  @override
  Future<ApiResults<MovieEntity>> getMovieDetails(int movieId) async {
    try {
      final response = await _movieDetailsDataSourceInterface.getMovieDetails(
        movieId: movieId,
      );

      final payload = response.data is Map ? response.data as Map : null;
      final data = payload?['data'];
      final movieJson = data is Map ? data['movie'] : null;

      if (response.statusCode == 200 && movieJson is Map) {
        return ApiResults.success(
          data: MovieModel.fromJson(
            Map<String, dynamic>.from(movieJson),
          ),
        );
      }

      final message =
          payload?['status_message']?.toString() ?? 'Movie not found';
      final exception = ServerFailure(
        statusCode: response.statusCode.toString(),
        message: message,
      );

      return ApiResults.failure(
        exception: exception,
      );
    } on DioException catch (error) {
      final exception = ServerFailure(
        statusCode: error.response?.statusCode.toString() ?? '',
        message: error.response?.data is Map
            ? error.response?.data['status_message']?.toString() ??
                error.message ??
                'Something went wrong'
            : error.message ?? 'Something went wrong',
      );

      return ApiResults.failure(
        exception: exception,
      );
    } catch (error) {
      final exception = ServerFailure(
        statusCode: '',
        message: error.toString(),
      );

      return ApiResults.failure(
        exception: exception,
      );
    }
  }

  
}