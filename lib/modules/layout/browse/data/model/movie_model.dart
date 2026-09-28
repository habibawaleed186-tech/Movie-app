import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.id,
    required super.title,
    required super.posterUrl,
    required super.rating,
    required super.year,
    required super.runtime,
    required super.genres,
    required super.description,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title']?.toString() ?? '',
      posterUrl: json['medium_cover_image']?.toString() ??
          json['large_cover_image']?.toString() ??
          '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      year: (json['year'] as num?)?.toInt() ?? 0,
      runtime: (json['runtime'] as num?)?.toInt() ?? 0,
      genres: (json['genres'] as List?)
              ?.map((genre) => genre?.toString() ?? '')
              .where((genre) => genre.isNotEmpty)
              .toList() ??
          const <String>[],
      description: (json['summary'] ??
              json['description_intro'] ??
              json['description_full'] ??
              json['synopsis'])
          ?.toString() ??
          '',
    );
  }
}