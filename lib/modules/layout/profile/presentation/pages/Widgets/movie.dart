import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../../../../core/assets/app_assets.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../data/model/profile_model.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../manager/profile_bloc.dart';

class Movie extends StatelessWidget {
  final ProfileEntity movie;

  const Movie({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final poster = movie.coverImage.isNotEmpty
        ? movie.coverImage
        : movie.backgroundImage;

    return GestureDetector(
      onTap: () {
        final movieId = movie.id;
        if (movieId == null) return;

        final profileMovie = ProfileModel(
          id: movie.id,
          rating: movie.rating,
          coverImage: movie.coverImage,
          backgroundImage: movie.backgroundImage,
        );

        GetIt.I<ProfileBloc>().add(
          AddHistoryEvent(profileMovie),
        );

        Navigator.pushNamed(
          context,
          AppRoutes.movieDetails,
          arguments: movieId,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: [
            Container(
              width: 120,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: poster.isNotEmpty && poster.startsWith('http')
                      ? NetworkImage(poster)
                      : const AssetImage(AppAssets.poster)
                  as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Rating
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 10,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${movie.rating}',

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
