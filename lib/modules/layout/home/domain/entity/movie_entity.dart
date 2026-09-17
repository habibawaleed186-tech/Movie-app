class MovieEntity {
  final int? id;
  final String title;
  final double rating;
  final int year;
  final int runtime;
  final int likeCount;
  final List<String> genres;
  final String summary;
  final String coverImage;
  final String backgroundImage;

  const MovieEntity({
    this.id,
    this.title = '',
    this.rating = 0.0,
    this.year = 0,
    this.runtime = 0,
    this.likeCount = 0,
    this.genres = const [],
    this.summary = '',
    this.coverImage = '',
    this.backgroundImage = '',
  });
}
