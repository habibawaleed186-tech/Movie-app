import 'package:dio/dio.dart';
import 'package:movie_app/core/Network/api_interface.dart';
import 'package:movie_app/modules/movie_details/data/data_source/movie_similar_data_source_interface.dart';

import '../../../../core/Network/end_points.dart';

class RemoteMovieSimilarDataSource implements MovieSimilarDataSourceInterface{

  ApiInterface _apiInterface;
  RemoteMovieSimilarDataSource(this._apiInterface);
  @override
  Future<Response<dynamic>>getMovieSuggestions(int movieId) async{
    return await _apiInterface.get(
      EndPoints.movieSuggestions,
      queryParameters: {
        'movie_id':movieId,
      }
    );
  }
}