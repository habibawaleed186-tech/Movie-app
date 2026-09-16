import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/assets/app_assets.dart';
import '../../core/config/app_color.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Dark,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      AppAssets.doctor,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 645.h,
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
                      top: 230.h,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: SvgPicture.asset(AppAssets.play),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20.h,
                      left: 16.w,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          AppAssets.arrow,
                          colorFilter: ColorFilter.mode(
                            AppColor.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20.h,
                      right: 16.w,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          AppAssets.bookmark,
                          colorFilter: ColorFilter.mode(
                            AppColor.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 545.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 28.w),
                          child: Column(
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
                              SizedBox(height: 15.h),
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
                      ),
                    ),
                  ],
                ),

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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        " Screen Shots",
                        textAlign: TextAlign.start,
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
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        " Similar ",
                        textAlign: TextAlign.start,
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
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        " Summary ",
                        textAlign: TextAlign.start,
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
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        " Following the events of Spider-Man No Way Home,\n"
                        " Doctor Strange unwittingly casts a forbidden spell that\n"
                        " accidentally opens up the multiverse. With help from\n"
                        " Wong and Scarlet Witch, Strange confronts various\n"
                        " versions of himself as well as teaming up with the\n"
                        " young America Chavez while traveling through various\n"
                        " realities and working to restore reality as he knows it.\n"
                        " Along the way, Strange and his allies realize they must\n"
                        " take on a powerful new adversary who seeks to take\n"
                        " over the multiverse.—Blazer346 ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        " Cast ",
                        textAlign: TextAlign.start,
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
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 105.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              AppAssets.cast1,
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name : Hayley Atwell",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Character : Captain Carter",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 105.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              AppAssets.cast2,
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name : Elizabeth Olsen",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                "Character :  Wanda Maximoff /\n"
                                "The Scarlet Witch",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 105.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              AppAssets.cast3,
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name : Rachel McAdams",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Character : Dr. Christine Palmer",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    height: 105.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.r),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              AppAssets.cast4,
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name : Charlize Theron",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Character : Clea",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        " Genres ",
                        textAlign: TextAlign.start,
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
                SizedBox(height: 3.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Container(
                        width: 122.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Text(
                            "Action",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        width: 122.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Text(
                            "Sci-Fi",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        width: 122.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Text(
                            "Adventure",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
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
                      Container(
                        width: 122.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Text(
                            "Fantasy",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        width: 122.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: Text(
                            "Horror",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
