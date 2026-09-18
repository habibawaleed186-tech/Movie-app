import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failures/faliure.dart';

import '../entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<MovieEntity>>> getMoviesByGenre(String genre);
}