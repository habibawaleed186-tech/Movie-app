import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/modules/Auth_screen/presentation/manager/auth_state.dart';
import '../manager/auth_bloc.dart';
import '../manager/auth_event.dart';
import '../widgets/custonWidget.dart';
import '../widgets/textFormField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess)
            {
              Navigator.pushReplacementNamed(context, AppRoutes.updateProfile);
            }
          else if (state is AuthError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)),);
          }
        },
       
        builder: (context,state){
         return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 55),
                    Image.asset('assets/images/primary2.png', width: 130, height: 120),
                    const SizedBox(height: 50),
         
         
                    Textformfield(
                      controller: _emailController,
                      prefixIcon: const Icon(Icons.email, color: Colors.white),
                      hintText: 'Email',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
         
                    const SizedBox(height: 30),
         
         
                    Textformfield(
                      controller: _passwordController,
                      obscureText: true,
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      hintText: 'Password',
                      suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
         
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.forgetPassword);
                        },
                        child: const Text(
                          'Forget Password ?',
                          style: TextStyle(
                            color: Color(0xFFFFBB3B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
         
                    const SizedBox(height: 40),
         
         
                    Customwidget(
                      text: 'Login',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                          LoginEvent(
                       email: _emailController.text.trim(),
                           password: _passwordController.text,
                                     ),
                               );
                        }
                      },
                    ),
         
                    const SizedBox(height: 20),
         
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don’t Have Account ?',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.registerView);
                          },
                          child: const Text(
                            ' Create One',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                              color: Color(0xFFFFBB3B),
                            ),
                          ),
                        ),
                      ],
                    ),
         
                    const SizedBox(height: 30),
         
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 95,
                          child: Divider(color: Color(0xFFFFBB3B), thickness: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
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
                          child: Divider(color: Color(0xFFFFBB3B), thickness: 1),
                        ),
                      ],
                    ),
         
                    const SizedBox(height: 25),
                    Customwidget(text: 'Google'),
                    const SizedBox(height: 20),
                    SvgPicture.asset('assets/icons/Language Switch.svg'),
                  ],
                ),
              ),
            ),
         );
        },
      ),
    );
}
}