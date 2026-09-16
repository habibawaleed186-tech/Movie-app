import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/config/app_color.dart';

class ScreenShots extends StatelessWidget {
  const ScreenShots({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Screen Shots",
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

        SizedBox(height: 9.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              AppAssets.screenshot1,
              width: double.infinity,
              height: 167.h,
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(height: 13.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              AppAssets.screenshot2,
              width: double.infinity,
              height: 167.h,
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(height: 13.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              AppAssets.screenshot3,
              width: double.infinity,
              height: 167.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
