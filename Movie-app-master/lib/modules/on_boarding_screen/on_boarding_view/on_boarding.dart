import 'package:flutter/material.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/modules/on_boarding_screen/on_boarding_view/widget/create_gradiant.dart';
import 'package:movie_app/modules/on_boarding_screen/on_boarding_view/widget/discover_gradiant.dart';
import 'package:movie_app/modules/on_boarding_screen/on_boarding_view/widget/explore_gradiant.dart';
import 'package:movie_app/modules/on_boarding_screen/on_boarding_view/widget/find_gradiant.dart';
import 'package:movie_app/modules/on_boarding_screen/on_boarding_view/widget/rate_gradiant.dart';
import 'package:movie_app/modules/on_boarding_screen/on_boarding_view/widget/start_gradiant.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int _currentindex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Dark,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        children: [
          FindGradiant(pageController: _pageController),
          DiscoverGradiant(pageController: _pageController),
          ExploreGradiant(pageController: _pageController),
          CreateGradiant(pageController: _pageController),
          RateGradiant(pageController: _pageController),
          StartGradiant(pageController: _pageController),
        ],
      ),
    );
  }
}