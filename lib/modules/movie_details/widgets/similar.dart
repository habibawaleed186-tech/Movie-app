import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/config/app_color.dart';

class Similar extends StatelessWidget {
  const Similar({super.key});

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
                "Similar",
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

        SizedBox(height: 11.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  AppAssets.similar1,
                  width: 189.w,
                  height: 279.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  AppAssets.similar2,
                  width: 189.w,
                  height: 279.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  AppAssets.similar3,
                  width: 189.w,
                  height: 279.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  AppAssets.similar4,
                  width: 189.w,
                  height: 279.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
