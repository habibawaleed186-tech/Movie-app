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
  Future<ApiResults<MovieEntity>> getMovieDetails(int movieId) async{
   try{
    final response = await _movieDetailsDataSourceInterface.getMovieDetails(movieId: movieId);
    if (response.statusCode == 200) {
      final movie = MovieModel.fromJson(
        response.data['data']['movie'],
      );

      return ApiResults.success(
        data: movie,
      );
    } else {
      final exception = ServerFailure(
        statusCode: response.statusCode.toString(),
        message: response.data['status_message'],
      );

      return ApiResults.failure(
        exception: exception,
      );
    }
   }on DioException catch(error){
     final exception = ServerFailure(
       statusCode: error.response?.statusCode.toString() ?? '',
       message: error.response?.data['status_message'] ??
           error.message ??
           'Something went wrong',
     );

     return ApiResults.failure(
       exception: exception,
     );
   }
   }

  
}