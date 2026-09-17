import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/core/routes/app_routes.dart';

import 'package:movie_app/modules/layout/home/domain/entity/movie_entity.dart';
class Similar extends StatelessWidget {

  final List<MovieEntity> movies;

  const Similar({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    print("Similar movies count: ${movies.length}");
    if (movies.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            "Similar",
            style: TextStyle(
              color: AppColor.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        SizedBox(height: 11.h),
        SizedBox(
          height: 279.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: GestureDetector(
                  onTap: () {
                    final movieId = movie.id;
                    if (movieId is! int) return;

                    Navigator.pushNamed(
                      context,
                      AppRoutes.movieDetails,
                      arguments: movieId,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(

                      movie.coverImage,
                      width: 189.w,
                      height: 279.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 189.w,
                          height: 279.h,
                          color: AppColor.grey,
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}