import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/config/app_color.dart';

import '../../../../core/assets/app_assets.dart';

class DiscoverGradiant extends StatelessWidget {
  const DiscoverGradiant({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColor.Dark,
        ),
        Image.asset(
          AppAssets.discover,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 710.h,
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColor.white.withValues(alpha: 0.1),
                  AppColor.turquoise.withValues(alpha: 0.35),
                  AppColor.turquoise.withValues(alpha: 1),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: AppColor.Dark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Discover Movies",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Explore a vast collection of movies in all\n"
                      " qualities and genres. Find your next\n"
                      " favorite film with ease.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: GestureDetector(
                    onTap: () {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.yellow,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: AppColor.Dark,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
