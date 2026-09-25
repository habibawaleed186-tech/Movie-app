import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../core/routes/app_routes.dart';
import '../../../../../Home_screen/update_view/presentation/manager/update_profile_bloc.dart';

class Profileactions extends StatelessWidget{

  Profileactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(

        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () async {
                final result = await Navigator.pushNamed(context, AppRoutes.updateProfile,);

                if (result == true) {
                  GetIt.I<UpdateProfileBloc>().add(
                    const GetProfileEvent(),
                  );
                }
              },
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFF6BD00),
                ),

                child: Center(
                  child: Text('Edit Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color(0xFF121312)),
     ),
                ),
                      ),
            ),),
          SizedBox(width: 10,),

          Expanded(
              flex: 1,
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFE82626),
                ),

            child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [


                 GestureDetector(
                   onTap: ()=>Navigator.pushReplacementNamed(context, AppRoutes.loginView),
                   child: Text('Exit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),
                    ),
                 ),

                SizedBox(width: 2,),
                Icon(Icons.exit_to_app,color: Colors.white,size: 20,)
              ],
            ),

          ),)
        ],
      ),
    );
  }

}