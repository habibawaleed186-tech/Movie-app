class MovieEntity {
  final int? id;
  final String title;
  final double rating;
  final int year;
  final String coverImage;

  const MovieEntity({
    this.id,
    this.title = '',
    this.rating = 0.0,
    this.year = 0,
    this.coverImage = '',
  });
}
