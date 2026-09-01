import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/app_router.dart';
import 'package:movie_app/core/routes/app_routes.dart';

import 'modules/Auth_screen/login_view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Login(),
      initialRoute: AppRoutes.loginView,
      onGenerateRoute: AppRouter.onGenerateRoute,

    );
  }
}


