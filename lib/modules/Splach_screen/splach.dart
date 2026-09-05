import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/modules/on_boarding_screen/on_boarding_view/on_boarding.dart';

import '../../gen/assets.gen.dart';


class SplashView extends StatefulWidget {
  static const String routeName = 'splash';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _navigationTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Dark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           Assets.images.logo.image(),

          ],
        ),
      ),
    );
  }
}