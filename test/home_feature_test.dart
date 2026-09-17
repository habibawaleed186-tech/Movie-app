import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/layout/home/data/model/movie_model.dart';

void main() {
  group('MovieModel', () {
    test('parses YTS movie payload with safe fallbacks', () {
      final movie = MovieModel.fromJson({
        'id': 61280,
        'title': 'Captain America',
        'year': 2024,
        'rating': 7.5,
        'genres': ['Action', 'Adventure'],
        'summary': 'Movie summary here...',
        'medium_cover_image': 'https://example.com/medium.jpg',
        'background_image': 'https://example.com/background.jpg',
      });

      expect(movie.id, 61280);
      expect(movie.title, 'Captain America');
      expect(movie.rating, 7.5);
      expect(movie.genres, ['Action', 'Adventure']);
      expect(movie.coverImage, 'https://example.com/medium.jpg');
      expect(movie.backgroundImage, 'https://example.com/background.jpg');
    });

    test('uses safe defaults when fields are null or empty', () {
      final movie = MovieModel.fromJson({
        'id': null,
        'title': null,
        'year': null,
        'rating': null,
        'genres': null,
        'summary': null,
      });

      expect(movie.id, isNull);
      expect(movie.title, isEmpty);
      expect(movie.year, 0);
      expect(movie.rating, 0.0);
      expect(movie.genres, isEmpty);
      expect(movie.coverImage, isEmpty);
      expect(movie.backgroundImage, isEmpty);
    });

    test('parses movie_details payload fields from API', () {
      final movie = MovieModel.fromJson({
        'id': 155,
        'title': 'African Cats',
        'year': 2010,
        'rating': 7.5,
        'runtime': 89,
        'like_count': 37,
        'genres': ['Action', 'Adventure', 'Documentary'],
        'description_intro': 'Meet Mara, an endearing lion cub.',
        'medium_cover_image': 'https://example.com/medium.jpg',
        'background_image': 'https://example.com/background.jpg',
      });

      expect(movie.id, 155);
      expect(movie.title, 'African Cats');
      expect(movie.year, 2010);
      expect(movie.rating, 7.5);
      expect(movie.runtime, 89);
      expect(movie.likeCount, 37);
      expect(movie.summary, 'Meet Mara, an endearing lion cub.');
      expect(movie.genres, ['Action', 'Adventure', 'Documentary']);
      expect(movie.coverImage, 'https://example.com/medium.jpg');
      expect(movie.backgroundImage, 'https://example.com/background.jpg');
    });
  });
}
