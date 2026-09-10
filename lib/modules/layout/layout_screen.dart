import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/app_assets.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/modules/layout/home_screen_layout.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = '/layout';

  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;

  final List<Widget> _screens = const <Widget>[
    HomeScreenLayout(),
    Center(child: Text('Browse Screen')),
    Center(child: Text('Search Screen')),
    Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.Dark,
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
                _buildNavItem(0, AppAssets.homeicon),
                _buildNavItem(1, AppAssets.browseicon),
                _buildNavItem(2, AppAssets.searchicon),
                _buildNavItem(3, AppAssets.profileicon),
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
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: isSelected ? AppColor.yellow.withValues(alpha: 0.12) : Colors.transparent,
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: isSelected ? AppColor.yellow : AppColor.white,
          ),
        ),
      ),
    );
  }
}
