import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/app_assets.dart';
import 'package:movie_app/core/config/app_color.dart';

class Background extends StatelessWidget {
  final String image;
  final String movieId;

  const Background({
    super.key,
    required this.image,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider =
    image.isNotEmpty && image.startsWith('http')
        ? NetworkImage(image)
        : const AssetImage(AppAssets.poster);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: Stack(
        key: ValueKey(movieId),
        fit: StackFit.expand,
        children: [
          Image(
            image: imageProvider,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            filterQuality: FilterQuality.high,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.15),
                  Colors.black.withValues(alpha: 0.35),
                  Colors.black.withValues(alpha: 0.70),
                  AppColor.Dark,
                ],
                stops: const [
                  0.0,
                  0.35,
                  0.75,
                  1.0,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}