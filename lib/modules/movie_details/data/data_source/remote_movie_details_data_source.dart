import 'package:dio/src/response.dart';
import 'package:movie_app/core/Network/api_interface.dart';
import 'package:movie_app/core/Network/end_points.dart';
import 'package:movie_app/modules/movie_details/data/data_source/movie_details_data_source_interface.dart';

class RemoteMovieDetailsDataSource  implements MovieDetailsDataSourceInterface{
  final  ApiInterface _apiInterface;
  RemoteMovieDetailsDataSource(this._apiInterface);
  
  @override
  Future<Response<dynamic>> getMovieDetails({required int movieId}) async {
    return await _apiInterface.get(
      EndPoints.movieDetails,
      queryParameters: {
        'movie_id': movieId,
      },
    );
  }

}