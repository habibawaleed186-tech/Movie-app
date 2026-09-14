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
  });
}
