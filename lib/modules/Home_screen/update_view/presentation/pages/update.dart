import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/config/app_color.dart';
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/modules/Home_screen/update_view/presentation/pages/widgets/bottom_sheet.dart';
import '../../../../../core/services/Snackbar_service.dart';
import '../../../../../core/utiles/avatar_data.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../Auth_screen/presentation/manager/auth_bloc.dart';
import '../../../../Auth_screen/presentation/manager/auth_state.dart';
import '../../../../Auth_screen/presentation/widgets/custonWidget.dart';
import '../../../../Auth_screen/presentation/widgets/textFormField.dart';
import '../../domain/entities/update_profile_entity.dart';
import '../manager/update_profile_bloc.dart';


class Update extends StatefulWidget {
  Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  int selectedIndex = 0;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<UpdateProfileBloc>().add(
      const GetProfileEvent(),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileBloc, UpdateProfileState>(
        listener: (context, state) {

          if (state is GetProfileLoading) {
            EasyLoading.show();
          }

          if (state is GetProfileSuccess) {
            EasyLoading.dismiss();

            nameController.text = state.data.name;
            phoneController.text = state.data.phone;

            setState(() {
              selectedIndex = state.data.avatarIndex;
            });
          }

          if (state is UpdateProfileLoading) {
            EasyLoading.show();
          }

          if (state is UpdateProfileSuccess) {
            EasyLoading.dismiss();

            BotToastService.showSuccessMessage(
              'Profile updated successfully',
            );
          }

          if (state is UpdateProfileError) {
            EasyLoading.dismiss();

            BotToastService.showErrorMessage(state.message,);
          }
          if (state is DeleteAccountLoading) {
            EasyLoading.show();
          }

          if (state is DeleteAccountSuccess) {

            EasyLoading.dismiss();

            BotToastService.showSuccessMessage('Account deleted successfully',);

            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.loginView, (route) => false,);
          }

          if (state is DeleteAccountError) {

            EasyLoading.dismiss();

            BotToastService.showErrorMessage(state.message,);
          }
        },



    child:  Scaffold(
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
                     avatarImages: AvatarData.images,
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
                child: AvatarData.images[selectedIndex].image(),
              ),
            ),

            Expanded(
              child: Form(child:
              Column(
                spacing: 16,
                children: [
                  Textformfield(
                    controller:nameController ,
                    hintText:  nameController.text,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(Assets.icons.user),
                    ),
                  ),
                  Textformfield(
                    controller:  phoneController,
                    hintText: phoneController.text,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(Assets.icons.phone),
                    ),
                  ),

                  GestureDetector(
                    onTap: ()=>Navigator.pushReplacementNamed(context,AppRoutes.forgetPassword),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, AppRoutes.forgetPassword);
                        },
                        child: Text("Reset Password",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
                          color: AppColor.white,
                        ),),
                      ),
                    ),
                  ),

                  Spacer(),
                  Customwidget(
                    onPressed: () {

                      showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return AlertDialog(title: const Text('Delete Account',),
                            content: const Text('Are you sure you want to delete your account?',),

                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(dialogContext);
                                },
                                child: const Text('Cancel'),
                              ),

                              TextButton(
                                onPressed: () {
                                  Navigator.pop(dialogContext);
                                  context
                                      .read<UpdateProfileBloc>()
                                      .add(
                                    const DeleteAccountEvent(),
                                  );
                                },

                                child: const Text(
                                  'Delete',
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    text: "Delete Account",
                    bgColor: AppColor.red,
                    textColor: AppColor.white,
                  ),

                  Customwidget(
                    onPressed: (){

                      final data = UpdateProfileEntity(
                        name: nameController.text.trim(),
                        phone: phoneController.text.trim(),
                        avatarIndex: selectedIndex,

                      );

                      context.read<UpdateProfileBloc>().add(SubmitUpdateProfileEvent(data: data,),);
                    },
                    text: "Update Data",
                  )

                ],

              )),
            ),



          ],
        ),
      ),
    ));
  }
}