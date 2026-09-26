import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/failures/faliure.dart';
import 'package:movie_app/core/failures/server_faliuer.dart';
import 'package:movie_app/modules/layout/browse/data/model/movie_model.dart';
import 'package:movie_app/modules/layout/browse/domain/entities/movie_entity.dart';
import 'package:movie_app/modules/layout/browse/domain/repository/movies_repository.dart';
import 'package:movie_app/modules/layout/browse/domain/use_cases/get_movies_by_genre_use_case.dart';
import 'package:movie_app/modules/layout/browse/presentation/cubit/browse_cubit.dart';
import 'package:movie_app/modules/layout/browse/presentation/cubit/browse_state.dart';

class _FakeMoviesRepository implements MoviesRepository {
  final Either<Failure, List<MovieEntity>> result;

  _FakeMoviesRepository(this.result);

  @override
  Future<Either<Failure, List<MovieEntity>>> getMoviesByGenre(String genre) {
    return Future.value(result);
  }
}

void main() {
  group('MovieModel (browse)', () {
    test('parses YTS genre list payload', () {
      final movie = MovieModel.fromJson(<String, dynamic>{
        'id': 78601,
        'title': 'Rage of Stars',
        'year': 2026,
        'rating': 4.8,
        'runtime': 98,
        'genres': <String>['Action', 'Sci-Fi', 'Thriller'],
        'summary': 'A gripping story.',
        'medium_cover_image': 'https://example.com/medium.jpg',
      });

      expect(movie.id, 78601);
      expect(movie.title, 'Rage of Stars');
      expect(movie.year, 2026);
      expect(movie.rating, 4.8);
      expect(movie.runtime, 98);
      expect(movie.genres, <String>['Action', 'Sci-Fi', 'Thriller']);
      expect(movie.description, 'A gripping story.');
      expect(movie.posterUrl, 'https://example.com/medium.jpg');
    });

    test('falls back safely when fields are missing', () {
      final movie = MovieModel.fromJson(<String, dynamic>{
        'large_cover_image': 'https://example.com/large.jpg',
      });

      expect(movie.id, 0);
      expect(movie.title, isEmpty);
      expect(movie.year, 0);
      expect(movie.rating, 0.0);
      expect(movie.runtime, 0);
      expect(movie.genres, isEmpty);
      expect(movie.description, isEmpty);
      expect(movie.posterUrl, 'https://example.com/large.jpg');
    });
  });

  group('BrowseCubit', () {
    test('defaults to Action genre', () {
      final cubit = BrowseCubit(
        getMoviesByGenreUseCase: GetMoviesByGenreUseCase(
          _FakeMoviesRepository(Right(const <MovieEntity>[])),
        ),
      );

      expect(BrowseCubit.defaultGenre, 'Action');
      expect(cubit.selectedGenre, 'Action');

      cubit.close();
    });

    test('emits loading then success when fetching movies by genre',
        () async {
      const movie = MovieModel(
        id: 1,
        title: 'Test Movie',
        posterUrl: 'https://example.com/poster.jpg',
        rating: 8.5,
        year: 2024,
        runtime: 120,
        genres: <String>['Action'],
        description: 'Test description',
      );

      final cubit = BrowseCubit(
        getMoviesByGenreUseCase: GetMoviesByGenreUseCase(
          _FakeMoviesRepository(Right(<MovieEntity>[movie])),
        ),
      );

      final states = <BrowseState>[];
      cubit.stream.listen(states.add);

      await cubit.fetchMoviesByGenre('Comedy');
      await cubit.close();

      expect(states.length, 2);
      expect(states[0], isA<BrowseLoading>());
      expect((states[0] as BrowseLoading).selectedGenre, 'Comedy');
      expect(states[1], isA<BrowseSuccess>());
      expect((states[1] as BrowseSuccess).selectedGenre, 'Comedy');
      expect(
        (states[1] as BrowseSuccess).movies.first.title,
        'Test Movie',
      );
      expect(cubit.selectedGenre, 'Comedy');
    });

    test('emits loading then error when the repository fails', () async {
      final cubit = BrowseCubit(
        getMoviesByGenreUseCase: GetMoviesByGenreUseCase(
          _FakeMoviesRepository(
            Left(
              ServerFailure(statusCode: '500', message: 'Server exploded'),
            ),
          ),
        ),
      );

      final states = <BrowseState>[];
      cubit.stream.listen(states.add);

      await cubit.fetchMoviesByGenre('Drama');
      await cubit.close();

      expect(states.length, 2);
      expect(states[0], isA<BrowseLoading>());
      expect(states[1], isA<BrowseError>());
      expect((states[1] as BrowseError).message, 'Server exploded');
      expect((states[1] as BrowseError).selectedGenre, 'Drama');
    });
  });
}