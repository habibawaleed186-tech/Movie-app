class ProfileEntity{
  final int? id;
  final double? rating;
  final String coverImage;
  final String backgroundImage;

  const ProfileEntity({
    this.id,
    this.rating ,
    this.coverImage = '',
    this.backgroundImage = '',
  });
}