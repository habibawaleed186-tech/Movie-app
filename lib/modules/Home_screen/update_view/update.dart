import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/modules/Home_screen/update_view/widgets/bottom_sheet.dart';

import '../../../gen/assets.gen.dart';
import '../../Auth_screen/widgets/customWidget.dart';
import '../../Auth_screen/widgets/textFormField.dart';


class Update extends StatefulWidget {
  Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  int selectedIndex = 0;
  final avatarImages = [
    Assets.images.gamer12,
    Assets.images.gamer11,
    Assets.images.gamer1,
    Assets.images.gamer14,
    Assets.images.gamer18,
    Assets.images.gamer13,
    Assets.images.gamer17,
    Assets.images.gamer16,
    Assets.images.gamer15,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Dark,
      appBar: AppBar(

        backgroundColor: AppColor.Dark,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: GestureDetector(
            onTap:(){},
              child: SvgPicture.asset(Assets.icons.arrowBack,)),
        ),
        title: Text("Pick Avatar",style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: "Roboto",
          color: AppColor.yellow
        ),),
        centerTitle: true,

      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: Column(
          spacing: 20,
          children: [
            GestureDetector(
              onTap:()=> showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(24)),
                context: context,
                builder: (context){
                 return  BottomSheetCard(
                     avatarImages: avatarImages,
                     onPicked:(index){
                       setState(() {
                         selectedIndex=index;
                       },);
                     }
                 );
                }
              ),
              child: CircleAvatar(
                radius: 70,
                child: avatarImages[selectedIndex].image(),
              ),
            ),

            Expanded(
              child: Form(child:
              Column(
                spacing: 16,
                children: [
                  Textformfield(
                    hintText: "John Safwat",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(Assets.icons.user),
                    ),
                  ),
                  Textformfield(
                    hintText: "01200000000",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(Assets.icons.phone),
                    ),
                  ),

                  GestureDetector(
                    onTap: ()=>Navigator.pushReplacementNamed(context,AppRoutes.forgetPassword),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Reset Password",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto",
                        color: AppColor.white,
                      ),),
                    ),
                  ),

                  Spacer(),
                  Customwidget(
                    text: "Delete Account",
                    bgColor: AppColor.red,
                    textColor: AppColor.white,
                  ),

                  Customwidget(
                    text: "Update Data",
                  )




                ],

              )),
            ),



          ],
        ),
      ),
    );
  }
}