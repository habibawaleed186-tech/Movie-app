import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/config/app_color.dart';

class Summary extends StatelessWidget {
  final String summary;

  const Summary({super.key, required this.summary});

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
                summary.isEmpty
                    ? "No summary available for this movie."
                    : summary,
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
      ],
    );
  }
}
