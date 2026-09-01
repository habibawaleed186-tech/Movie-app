import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/modules/Auth_screen/widgets/customWidget.dart';

import '../widgets/avatar.dart';
import '../widgets/textFormField.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15151F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.amber),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
              const SizedBox(height: 8),

              Avatar(),
              Center(
                child: Text(
                  'Avatar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Textformfield(hintText: 'Name',prefixIcon: Icon(Icons.person,color: Colors.white,),),
              const SizedBox(height: 20),
              Textformfield(prefixIcon: Icon(Icons.email,color: Colors.white,), hintText: 'Email'),
              const SizedBox(height: 20),
              Textformfield(
                prefixIcon: Icon(Icons.lock,color: Colors.white),
                hintText: 'Password',
                suffixIcon: Icon(Icons.visibility_off_outlined,color: Colors.white),),
              const SizedBox(height: 20),
              Textformfield(
                prefixIcon: Icon(Icons.lock,color: Colors.white),
                hintText: 'Confirm Password',
                suffixIcon: Icon(Icons.visibility_off_outlined,color: Colors.white),),
              const SizedBox(height: 20),
              Textformfield(
                prefixIcon: Icon(Icons.lock,color: Colors.white),
                hintText: 'Phone Number',
                suffixIcon: Icon(Icons.phone,color: Colors.white),),
              const SizedBox(height: 20),
              Customwidget(text: 'Google',),
              const SizedBox(height: 10),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Have Account ?',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white,

                  ),),

                    Text('Login',style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      color: Color(0xFFFFBB3B),

                    ),),
                ],
              ),
              const SizedBox(height: 15),
              Center(child: SvgPicture.asset('assets/icons/Language Switch.svg')),

            ],
          ),
        ),
      ),
    );
  }
}
