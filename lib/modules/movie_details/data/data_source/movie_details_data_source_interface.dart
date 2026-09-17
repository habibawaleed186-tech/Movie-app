import 'package:dio/dio.dart';

abstract class MovieDetailsDataSourceInterface {

  Future<Response> getMovieDetails ({required int movieId});
}