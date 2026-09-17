import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/cast.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/genres.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/movie_header.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/screen_shots.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/similar.dart';
import 'package:movie_app/modules/movie_details/presentation/pages/movie_details_screen/widgets/summary.dart';

import '../../../../../core/config/app_color.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Dark,
      body: SingleChildScrollView(
        child:
            Column(
              children: [
                const MovieHeader(),
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
                              "15",
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
                              "90",
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
                              "7.6",
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
                ScreenShots(),
                SizedBox(height: 16.h),
                Similar(),
                SizedBox(height: 16.h),
                Summary(),
                SizedBox(height: 16.h),
                Cast(),
                SizedBox(height: 16.h),
                Genres(),
                SizedBox(height: 60.h),
              ],
            ),

      ),

    );
  }
}
