import '../../domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    super.id,
    super.title,
    super.rating,
    super.year,
    super.runtime,
    super.likeCount,
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

    // list_movies returns "summary" while movie_details returns
    // "description_intro" / "description_full".
    final summary = (map['summary'] ??
            map['description_intro'] ??
            map['description_full'])
        ?.toString() ?? '';

    final year = map['year'] is num ? (map['year'] as num).toInt() : 0;
    final runtime = map['runtime'] is num ? (map['runtime'] as num).toInt() : 0;
    final likeCount =
        map['like_count'] is num ? (map['like_count'] as num).toInt() : 0;
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
      runtime: runtime,
      likeCount: likeCount,
      genres: genres,
      summary: summary,
      coverImage: coverImage,
      backgroundImage: backgroundImage,
    );
  }
}
