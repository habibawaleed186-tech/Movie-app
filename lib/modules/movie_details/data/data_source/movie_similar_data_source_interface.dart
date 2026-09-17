import 'package:dio/dio.dart';

abstract class MovieSimilarDataSourceInterface {

  Future<Response<dynamic>> getMovieSuggestions(int movieId);

}