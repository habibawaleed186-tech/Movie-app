import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routes/app_router.dart';
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/modules/Auth_screen/register_view/register.dart';
import 'package:movie_app/modules/Home_screen/update_view/update.dart';

import 'modules/Auth_screen/login_view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.Splach,
          onGenerateRoute: AppRouter.onGenerateRoute,

        );
      }
    );
  }
}


