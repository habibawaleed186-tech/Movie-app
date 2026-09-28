import 'package:flutter/material.dart';
import 'package:movie_app/core/config/app_color.dart';

import '../../../../../../gen/assets.gen.dart';

class AvatarCard extends StatelessWidget {
  final AssetGenImage imagePath;
  final bool isPicked;
  final VoidCallback onTap;

  const AvatarCard({super.key,
    required this.imagePath,
    required this.isPicked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:BoxDecoration(
          color:isPicked?AppColor.yellow.withValues(alpha: 0.56):AppColor.primaryColor,
          border: Border.all(
            color: AppColor.yellow
          ),
          borderRadius: BorderRadius.circular(20),

        ),
        child: ClipRRect(

          child: Padding(
            padding: const EdgeInsets.all(12),
            child: imagePath.image(),
        ),
      )),
    );
  }
}
