import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String image;

  const Background({
    super.key,
    required this.image,
  });

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
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.15),
                  Colors.black.withOpacity(0.45),
                  Colors.black.withOpacity(0.85),
                  Colors.black,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}