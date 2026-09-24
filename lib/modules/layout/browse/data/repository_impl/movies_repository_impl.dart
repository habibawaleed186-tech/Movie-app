import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/failures/faliure.dart';
import 'package:movie_app/core/failures/server_faliuer.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/repository/movies_repository.dart';
import '../data_source/movies_remote_data_source.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesByGenre(
    String genre,
  ) async {
    try {
      final movies = await remoteDataSource.getMoviesByGenre(genre);
      return Right(movies);
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? '',
          message: error.message ?? 'Something went wrong while loading movies.',
        ),
      );
    } catch (error) {
      return Left(
        ServerFailure(
          statusCode: '',
          message: error
              .toString()
              .replaceFirst('Exception: ', '')
              .replaceFirst('FormatException: ', ''),
        ),
      );
    }
  }
}