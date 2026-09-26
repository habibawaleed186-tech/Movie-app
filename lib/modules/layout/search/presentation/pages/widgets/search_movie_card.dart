import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/modules/layout/search/domain/entities/movie_entity.dart'
    as search_entity;

class SearchMovieCard extends StatelessWidget {
  final search_entity.MovieEntity movie;

  const SearchMovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Stack(
        children: [
          Image.network(
            movie.coverImage,
            width: double.infinity,
            height: 279.h,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: double.infinity,
                height: 279.h,
                color: AppColor.grey,
                child: const Icon(Icons.broken_image, color: Colors.white),
              );
            },
          ),
          Positioned(
            top: 13.h,
            left: 10.w,
            child: Container(
              width: 58.w,
              height: 28.h,
              decoration: BoxDecoration(
                color: AppColor.grey.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${movie.rating}",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Icon(
                      Icons.star,
                      color: AppColor.yellow,
                      size: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
