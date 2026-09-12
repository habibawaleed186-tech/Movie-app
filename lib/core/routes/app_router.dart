
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/Splach_screen/splach.dart';
import 'package:movie_app/modules/on_boarding_screen/on_boarding_view/on_boarding.dart';
import '../../modules/Auth_screen/presentation/pages/login.dart';
import '../../modules/Auth_screen/presentation/pages/register.dart';
import '../../modules/Auth_screen/presentation/pages/reset_password.dart';
import '../../modules/Home_screen/update_view/presentation/manager/update_profile_bloc.dart';
import '../../modules/Home_screen/update_view/presentation/pages/update.dart';
import 'app_routes.dart';

abstract class AppRouter {

  static  Route<dynamic>? onGenerateRoute (RouteSettings settings)
  {

    switch(settings.name)
    {
      case AppRoutes.Splach:
        return MaterialPageRoute(builder: (context)=> SplashView());

      case AppRoutes.onBoarding:
        return MaterialPageRoute(builder: (context) => OnBoarding());

      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (context) => Login());

      case AppRoutes.registerView:
        return MaterialPageRoute(builder: (context) => Register());

      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (context) => ResetPassword());
      case AppRoutes.updateProfile:
        return MaterialPageRoute(builder: (((context) => BlocProvider<UpdateProfileBloc>(
          create: (context) => UpdateProfileBloc(),
          child: Update(),
        ))));


    }

  }



}