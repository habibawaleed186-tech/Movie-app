import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets/app_assets.dart';
import '../../../core/config/app_color.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 645.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: 645.h,
            width: double.infinity,
            child: Image.asset(AppAssets.doctor, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.white.withValues(alpha: 0.1),
                    AppColor.Dark.withValues(alpha: 0.7),
                    AppColor.Dark.withValues(alpha: 1),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200.h,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppAssets.play),
            ),
          ),
          Positioned(
            top: 20.h,
            left: 16.w,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: SvgPicture.asset(
                AppAssets.arrow,
                colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
              ),
            ),
          ),
          Positioned(
            top: 20.h,
            right: 16.w,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppAssets.bookmark,
                colorFilter: ColorFilter.mode(AppColor.white, BlendMode.srcIn),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Doctor Strange in the Multiverse\n of Madness",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "2022",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.text,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
