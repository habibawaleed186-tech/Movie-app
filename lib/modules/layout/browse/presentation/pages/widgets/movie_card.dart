import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/config/app_color.dart';

import '../../../domain/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColoredBox(
              color: AppColor.grey,
              child: movie.posterUrl.isNotEmpty &&
                      movie.posterUrl.startsWith('http')
                  ? Image.network(
                      movie.posterUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          color: AppColor.white,
                        );
                      },
                    )
                  : const Icon(Icons.movie, color: AppColor.white),
            ),
            Positioned(
              top: 8.h,
              left: 8.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      movie.rating.toStringAsFixed(1),
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,

                          )
                      ),
              SizedBox(width: 4.w),
              const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 12,)
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