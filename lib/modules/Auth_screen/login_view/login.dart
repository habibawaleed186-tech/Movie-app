import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../core/routes/app_routes.dart';
import '../widgets/customWidget.dart';
import '../widgets/textFormField.dart';

class Login extends StatelessWidget {
  Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121312),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 55),
              Image.asset('assets/images/primary2.png', width: 130,height: 120,),
              SizedBox(height: 50),
              Textformfield(prefixIcon: Icon(Icons.email,color: Colors.white,), hintText: 'Email'),
              SizedBox(height: 30),
              Textformfield(
                prefixIcon: Icon(Icons.lock,color: Colors.white),
                hintText: 'Password',
                suffixIcon: Icon(Icons.visibility_off_outlined,color: Colors.white),
              ),

              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.forgetPassword);
                  },
                  child: Text(
                    'Forget Password ?',
                    style: TextStyle(
                      color: Color(0xFFFFBB3B),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Customwidget(
                text: 'Login',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.layout,
                    (route) => false,
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t Have Account ?',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white,

                  ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, AppRoutes.registerView);
                    },
                    child: Text(' Create One',style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      color: Color(0xFFFFBB3B),

                    ),),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 95,
                    child: Divider(
                      color:Color(0xFFFFBB3B),
                      thickness: 1,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Color(0xFFFFBB3B),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 95,
                    child: Divider(
                      color:Color(0xFFFFBB3B),
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Customwidget(text: 'Google',),
              SizedBox(height: 20),
              SvgPicture.asset('assets/icons/Language Switch.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
