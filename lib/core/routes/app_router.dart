
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/Splach_screen/splach.dart';
import 'package:movie_app/modules/layout/home/presentation/pages/layout_screen.dart';
import 'package:movie_app/modules/on_boarding_screen/on_boarding_view/on_boarding.dart';

import '../../modules/Home_screen/update_view/presentation/manager/update_profile_bloc.dart';
import '../../modules/Home_screen/update_view/presentation/pages/update.dart';
import '../../modules/auth_screen/presentation/pages/login.dart';
import '../../modules/auth_screen/presentation/pages/register.dart';
import '../../modules/auth_screen/presentation/pages/reset_password.dart';
import 'package:movie_app/core/di/app_di.dart';
import '../../modules/layout/browse/domain/use_cases/get_movies_by_genre_use_case.dart';
import '../../modules/layout/browse/presentation/cubit/browse_cubit.dart';
import '../../modules/layout/browse/presentation/pages/browse_screen.dart';
import '../../modules/movie_details/presentation/pages/movie_details_screen/movie_details_view.dart';
import '../../modules/movie_details/presentation/manager/movie_details_bloc.dart';
import 'app_routes.dart';

abstract class AppRouter {

  static  Route<dynamic>? onGenerateRoute (RouteSettings settings)
  {

    switch(settings.name)
    {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context)=> SplashView());

      case AppRoutes.onBoarding:
        return MaterialPageRoute(builder: (context) => OnBoarding());

      case AppRoutes.loginView:
        return MaterialPageRoute(builder: (context) => Login());

      case AppRoutes.registerView:
        return MaterialPageRoute(builder: (context) => Register());

      case AppRoutes.layout:
        return MaterialPageRoute(builder: (context) => const LayoutScreen());

      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (context) => ResetPassword());

      case AppRoutes.browse:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider<BrowseCubit>(
            create: (context) => BrowseCubit(
              getMoviesByGenreUseCase: getIt<GetMoviesByGenreUseCase>(),
            ),
            child: const BrowseScreen(),
          ),
        );

      case AppRoutes.movieDetails:
        final arguments = settings.arguments;
        final int movieId = arguments is int
            ? arguments
            : int.tryParse('$arguments') ?? 0;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider<MovieDetailsBloc>(
            create: (context) => MovieDetailsBloc(),
            child: MovieDetailsView(movieId: movieId),
          ),
        );

      case AppRoutes.updateProfile:
        return MaterialPageRoute(builder: (((context) => BlocProvider<UpdateProfileBloc>(
          create: (context) => UpdateProfileBloc(),
          child: Update(),
        ))));

      default:
        return null;
    }

  }



}


