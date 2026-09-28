import 'package:flutter/material.dart';

import '../../../../../../gen/assets.gen.dart';
import 'avatar_card.dart';
class BottomSheetCard extends StatefulWidget {
  final List<AssetGenImage> avatarImages;
  final Function(int) onPicked;

  const BottomSheetCard({
    super.key,
    required this.avatarImages,
    required this.onPicked,
  });

  @override
  State<BottomSheetCard> createState() => _BottomSheetCardState();
}

class _BottomSheetCardState extends State<BottomSheetCard> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      height: MediaQuery.of(context).size.height * 0.45,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: widget.avatarImages.length,
          itemBuilder: (context, index) {
            return AvatarCard(
              imagePath: widget.avatarImages[index],
              isPicked: selectedIndex == index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });

                widget.onPicked(index);
              },
            );
          },
        ),
      ),
    );
  }
}