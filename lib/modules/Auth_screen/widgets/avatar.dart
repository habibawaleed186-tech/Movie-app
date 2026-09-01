import 'package:flutter/cupertino.dart';

class Avatar extends StatefulWidget{

  Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {

  final PageController _pageController=PageController(
    viewportFraction: 0.35,
    initialPage: 1,
  );
  int selectedIndex=1;
  final List<String> avatars=[
    'assets/images/gamer (1).png',
    'assets/images/gamer (1) (1).png',
    'assets/images/gamer (1) (2).png',
    'assets/images/gamer (1) (3).png',
    'assets/images/gamer (1) (4).png',
    'assets/images/gamer (1) (5).png',
    'assets/images/gamer (1) (6).png',
    'assets/images/gamer (1) (7).png',

  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: avatars.length,
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            selectedIndex=index;
          });

        },
        itemBuilder: (context,index)
        {
          final bool isSelected=selectedIndex==index;
          return Center(
            child: AnimatedContainer(duration:
            Duration(milliseconds: 300),
              width: isSelected ? 158 : 70,
              height: isSelected ? 161 : 70,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(avatars[index]),
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