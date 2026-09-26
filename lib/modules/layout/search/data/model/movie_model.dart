import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    super.id,
    super.title,
    super.rating,
    super.year,
    super.coverImage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] is num ? (json['id'] as num).toInt() : null,
      title: json['title']?.toString() ?? '',
      rating: json['rating'] is num ? (json['rating'] as num).toDouble() : 0.0,
      year: json['year'] is num ? (json['year'] as num).toInt() : 0,
      coverImage: json['medium_cover_image']?.toString() ?? '',
    );
  }
}
