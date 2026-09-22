import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets/ProfileActions.dart';
import 'Widgets/ProfileHeader.dart';
import 'Widgets/ProfileTabsWidget.dart';

class ProfileView extends StatelessWidget{

  ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282A28),
        body: Column(
          children: [
            SizedBox(height: 40),
            Profileheader(),
            Profileactions(),
            ProfileTabsWidget(),
          ],
      ),
    );
  }
}