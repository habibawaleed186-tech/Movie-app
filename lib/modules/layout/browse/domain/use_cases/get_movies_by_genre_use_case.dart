import 'package:dartz/dartz.dart';
import 'package:movie_app/core/failures/faliure.dart';

import '../entities/movie_entity.dart';
import '../repository/movies_repository.dart';

class GetMoviesByGenreUseCase {
  final MoviesRepository repository;

  GetMoviesByGenreUseCase(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call(String genre) {
    return repository.getMoviesByGenre(genre);
  }
}