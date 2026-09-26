class MovieEntity {
  final int id;
  final String title;
  final String posterUrl;
  final double rating;
  final int year;
  final int runtime;
  final List<String> genres;
  final String description;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.rating,
    required this.year,
    required this.runtime,
    required this.genres,
    required this.description,
  });
}