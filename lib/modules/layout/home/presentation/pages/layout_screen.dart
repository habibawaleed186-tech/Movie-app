import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/assets/app_assets.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/core/di/app_di.dart';
import 'package:movie_app/modules/layout/browse/domain/use_cases/get_movies_by_genre_use_case.dart';
import 'package:movie_app/modules/layout/browse/presentation/cubit/browse_cubit.dart';
import 'package:movie_app/modules/layout/browse/presentation/pages/browse_screen.dart';
import 'package:movie_app/modules/layout/home/presentation/pages/home_screen_layout.dart';

import '../../../profile/presentation/pages/profile_view.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = '/layout';

  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  final List<Widget> _screens = <Widget>[
    const HomeScreenLayout(),
    BlocProvider<BrowseCubit>(
      create: (context) => BrowseCubit(
        getMoviesByGenreUseCase: getIt<GetMoviesByGenreUseCase>(),
      ),
      child: const BrowseScreen(showBackButton: false),
    ),
    const Center(child: Text('Search Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.dark,
      body: _screens[selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Container(
            height: 72,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: _buildNavItem(0, AppAssets.homeicon)),
                Expanded(child: _buildNavItem(1, AppAssets.browseicon)),
                Expanded(child: _buildNavItem(2, AppAssets.searchicon)),
                Expanded(child: _buildNavItem(3, AppAssets.profileicon)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
        child: Center(
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: isSelected ? AppColor.yellow : AppColor.white,
          ),
        ),
    );
  }
}
