import '../../domain/entities/profile_entity.dart';
class ProfileModel extends ProfileEntity {
  const ProfileModel({
    super.id,
    super.rating,
    super.coverImage,
    super.backgroundImage,
  });

  factory ProfileModel.fromEntity(ProfileEntity profile) {
    return ProfileModel(
      id: profile.id,
      rating: profile.rating,
      coverImage: profile.coverImage,
      backgroundImage: profile.backgroundImage,
    );
  }

  factory ProfileModel.fromJson(Map<String, dynamic>? json) {
    final map = json ?? {};

    return ProfileModel(
      id: map['id'] is num
          ? (map['id'] as num).toInt()
          : null,

      rating: map['rating'] is num
          ? (map['rating'] as num).toDouble()
          : 0.0,
      coverImage: map['cover_image']?.toString() ?? '',
      backgroundImage: map['background_image']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rating': rating,
      'cover_image': coverImage,
      'background_image': backgroundImage,
    };
  }
}