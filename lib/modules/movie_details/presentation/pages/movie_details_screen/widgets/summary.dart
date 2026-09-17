import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/config/app_color.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

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
      ],
    );
  }
}
