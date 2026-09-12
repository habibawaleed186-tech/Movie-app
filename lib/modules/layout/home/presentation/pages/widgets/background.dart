import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/core/config/app_color.dart';

class Background extends StatelessWidget {
  final String image;

  const Background({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.grey,
                  AppColor.Dark,
                ],
                stops: const [0.0, 0.42, 0.7, 1.0],
              ),
            ),
          ),
        ),
      ],
    );
  }
}