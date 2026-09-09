
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets/app_assets.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/routes/app_routes.dart';
import '../manager/auth_bloc.dart';
import '../manager/auth_event.dart';
import '../widgets/custonWidget.dart';


class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Dark,
      appBar:
      PreferredSize(preferredSize: Size.fromHeight(64.h),
        child: AppBar(
          backgroundColor: AppColor.Dark,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            iconSize: 21,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Forget Password", style: TextStyle(
            color: AppColor.yellow,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity, height: 430.h,
              child: Image.asset(AppAssets.forgotPassword,
                fit: BoxFit.contain,),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    style: TextStyle(color: AppColor.white, fontSize: 16.sp),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.primaryColor,
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: AppColor.white, fontSize: 16.sp),
                      prefixIcon: Icon(
                          Icons.email_outlined, color: AppColor.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide.none,
                      ),

                    ),
                  ),
                  SizedBox(height: 24.h),

                  GestureDetector(
                      onTap: (){
                        BlocProvider.of<AuthBloc>(context).add(
                            ResetPasswordEvent(email: emailController.text));
                      },
                      child: Customwidget(
                        text: "Verify Email",
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}