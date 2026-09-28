import 'package:flutter/cupertino.dart';

import '../../../../core/utiles/avatar_data.dart';

class Avatar extends StatefulWidget {
  final ValueChanged<int>? onAvatarSelected;

  const Avatar({super.key, this.onAvatarSelected});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final PageController _pageController = PageController(
    viewportFraction: 0.35,
    initialPage: 1,
  );
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: AvatarData.images.length,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });

          if (widget.onAvatarSelected != null) {
            widget.onAvatarSelected!(index);
          }
        },
        itemBuilder: (context, index) {
          final bool isSelected = selectedIndex == index;
          return Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSelected ? 158 : 70,
              height: isSelected ? 161 : 70,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AvatarData.images[index].provider(),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}