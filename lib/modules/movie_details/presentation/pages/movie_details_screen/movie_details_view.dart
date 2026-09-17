import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/cast.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/genres.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/movie_header.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/screen_shots.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/similar.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/summary.dart';

import '../../../../../core/config/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/movie_details_bloc.dart';


class MovieDetailsView extends StatefulWidget {
  final int movieId;
  const MovieDetailsView({super.key, required this.movieId});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailsBloc>().add(GetMovieDetailsEvent(movieId: widget.movieId));
    context.read<MovieDetailsBloc>().add(GetMovieSuggestionsEvent(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Dark,
      body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColor.red),
            );
          } else if (state is MovieDetailsError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: AppColor.white, fontSize: 16.sp),
              ),
            );
          } else if (state is MovieDetailsSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  MovieHeader(movie: state.movie),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.red,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Text(
                            "Watch",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 122.w,
                          height: 47.h,
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 12.w),
                              Icon(
                                Icons.favorite,
                                color: AppColor.yellow,
                                size: 24.sp,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                '${state.movie.likeCount}',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 122.w,
                          height: 47.h,
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 12.w),
                              Icon(
                                Icons.timelapse_sharp,
                                color: AppColor.yellow,
                                size: 24.sp,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                '${state.movie.runtime}m',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 122.w,
                          height: 47.h,
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: AppColor.grey,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 12.w),
                              Icon(
                                Icons.star,
                                color: AppColor.yellow,
                                size: 24.sp,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                state.movie.rating.toStringAsFixed(1),
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const ScreenShots(),
                  SizedBox(height: 16.h),
                  Similar(movies: state.similarMovies),

                  SizedBox(height: 16.h),
                  Summary(summary: state.movie.summary),
                  SizedBox(height: 16.h),
                  const Cast(),
                  SizedBox(height: 16.h),
                  Genres(genres: state.movie.genres),
                  SizedBox(height: 60.h),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}