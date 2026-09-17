import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.id,
    required super.url,
    required super.imdbCode,
    required super.title,
    required super.titleEnglish,
    required super.titleLong,
    required super.slug,
    required super.year,
    required super.rating,
    required super.runtime,
    required super.genres,
    required super.likeCount,
    required super.descriptionIntro,
    required super.descriptionFull,
    required super.ytTrailerCode,
    required super.language,
    required super.mpaRating,
    required super.backgroundImage,
    required super.backgroundImageOriginal,
    required super.smallCoverImage,
    required super.mediumCoverImage,
    required super.largeCoverImage,
    required super.torrents,
    required super.dateUploaded,
    required super.dateUploadedUnix,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      url: json['url'] ?? '',
      imdbCode: json['imdb_code'] ?? '',
      title: json['title'] ?? '',
      titleEnglish: json['title_english'] ?? '',
      titleLong: json['title_long'] ?? '',
      slug: json['slug'] ?? '',
      year: json['year'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      runtime: json['runtime'] ?? 0,

      genres: List<String>.from(
        json['genres'] ?? [],
      ),

      likeCount: json['like_count'] ?? 0,

      descriptionIntro:
      json['description_intro'] ?? '',

      descriptionFull:
      json['description_full'] ?? '',

      ytTrailerCode:
      json['yt_trailer_code'] ?? '',

      language: json['language'] ?? '',

      mpaRating:
      json['mpa_rating'] ?? '',

      backgroundImage:
      json['background_image'] ?? '',

      backgroundImageOriginal:
      json['background_image_original'] ?? '',

      smallCoverImage:
      json['small_cover_image'] ?? '',

      mediumCoverImage:
      json['medium_cover_image'] ?? '',

      largeCoverImage:
      json['large_cover_image'] ?? '',

      torrents: (json['torrents'] as List<dynamic>? ?? [])
          .map(
            (e) => TorrentModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
          .toList(),

      dateUploaded:
      json['date_uploaded'] ?? '',

      dateUploadedUnix:
      json['date_uploaded_unix'] ?? 0,
    );
  }
}


class TorrentModel extends TorrentEntity {
  TorrentModel({
    required super.url,
    required super.hash,
    required super.quality,
    required super.type,
    required super.isRepack,
    required super.videoCodec,
    required super.bitDepth,
    required super.audioChannels,
    required super.seeds,
    required super.peers,
    required super.size,
    required super.sizeBytes,
    required super.dateUploaded,
    required super.dateUploadedUnix,
  });

  factory TorrentModel.fromJson(Map<String, dynamic> json) {
    return TorrentModel(
      url: json['url'] ?? '',
      hash: json['hash'] ?? '',
      quality: json['quality'] ?? '',
      type: json['type'] ?? '',
      isRepack: json['is_repack'] ?? '',
      videoCodec: json['video_codec'] ?? '',
      bitDepth: json['bit_depth']?.toString() ?? '',
      audioChannels: json['audio_channels'] ?? '',
      seeds: json['seeds'] ?? 0,
      peers: json['peers'] ?? 0,
      size: json['size'] ?? '',
      sizeBytes: json['size_bytes'] ?? 0,
      dateUploaded: json['date_uploaded'] ?? '',
      dateUploadedUnix: json['date_uploaded_unix'] ?? 0,
    );
  }
}