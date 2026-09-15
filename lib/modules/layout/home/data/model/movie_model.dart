import '../../domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    super.id,
    super.title,
    super.rating,
    super.year,
    super.genres,
    super.summary,
    super.coverImage,
    super.backgroundImage,
  });

  factory MovieModel.fromJson(Map<String, dynamic>? json) {
    final map = json ?? <String, dynamic>{};

    final rawRating = map['rating'];
    final parsedRating = rawRating is num ? rawRating.toDouble() : 0.0;

    final rawGenres = map['genres'];
    final genres = rawGenres is List
        ? rawGenres.map((genre) => genre?.toString() ?? '').where((value) => value.isNotEmpty).toList()
        : <String>[];

    final title = map['title']?.toString() ?? '';
    final summary = map['summary']?.toString() ?? '';
    final year = map['year'] is num ? (map['year'] as num).toInt() : 0;
    final coverImage =
        map['medium_cover_image']?.toString() ??
        map['large_cover_image']?.toString() ??
        '';
    final backgroundImage = map['background_image']?.toString() ?? '';

    return MovieModel(
      id: map['id'] is num ? (map['id'] as num).toInt() : null,
      title: title,
      rating: parsedRating,
      year: year,
      genres: genres,
      summary: summary,
      coverImage: coverImage,
      backgroundImage: backgroundImage,
    );
  }
}
