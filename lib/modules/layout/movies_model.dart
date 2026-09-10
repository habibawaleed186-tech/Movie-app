import 'package:movie_app/core/assets/app_assets.dart';

class MoviesModel {
  final String image;
  final double rating;

  MoviesModel({required this.image, required this.rating});
}

List<MoviesModel> moviesList = [
  MoviesModel(image: AppAssets.index1, rating: 4.5),
  MoviesModel(image: AppAssets.index2, rating: 4.0),
  MoviesModel(image: AppAssets.index3, rating: 3.5),
  MoviesModel(image: AppAssets.index4, rating: 5.0),
  MoviesModel(image: AppAssets.index5, rating: 4.2),
  MoviesModel(image: AppAssets.index6, rating: 3.8),
  MoviesModel(image: AppAssets.index7, rating: 4.7),
  MoviesModel(image: AppAssets.index8, rating: 4.1),
  MoviesModel(image: AppAssets.index9, rating: 3.9),
  MoviesModel(image: AppAssets.index10, rating: 4.3),
  MoviesModel(image: AppAssets.index11, rating: 4.6),
];