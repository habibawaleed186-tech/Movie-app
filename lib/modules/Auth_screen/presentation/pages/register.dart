import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/routes/app_routes.dart';
import '../../domain/entities/user_entity.dart';
import '../manager/auth_bloc.dart';
import '../manager/auth_event.dart';
import '../manager/auth_state.dart';
import '../widgets/avatar.dart';
import '../widgets/custonWidget.dart';
import '../widgets/textFormField.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<Register> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  int _selectedAvatarIndex = 1;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account Created Successfully! 🎉'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacementNamed(context, AppRoutes.loginView);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF15151F),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
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

                    Avatar(
                      onAvatarSelected: (index) {
                        setState(() {
                          _selectedAvatarIndex = index;
                        });
                      },
                    ),

                    const Center(
                      child: Text(
                        'Avatar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Textformfield(
                      controller: _nameController,
                      hintText: 'Name',
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      validator: (val) => val == null || val.trim().isEmpty ? 'Enter your name' : null,
                    ),
                    const SizedBox(height: 16),

                    Textformfield(
                      controller: _emailController,
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email, color: Colors.white),
                      validator: (val) => val == null || val.trim().isEmpty ? 'Enter your email' : null,
                    ),
                    const SizedBox(height: 16),

                    Textformfield(
                      controller: _passwordController,
                      obscureText: true,
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.white),
                      validator: (val) => val == null || val.length < 6 ? 'Password must be at least 6 chars' : null,
                    ),
                    const SizedBox(height: 16),

                    Textformfield(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      hintText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.white),
                      validator: (val) {
                        if (val != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    Textformfield(
                      controller: _phoneController,
                      hintText: 'Phone Number',
                      prefixIcon: const Icon(Icons.lock, color: Colors.white),
                      suffixIcon: const Icon(Icons.phone, color: Colors.white),
                      validator: (val) => val == null || val.trim().isEmpty ? 'Enter phone number' : null,
                    ),
                    const SizedBox(height: 24),

                    Customwidget(
                      text: 'Create Account',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('Avatar: $_selectedAvatarIndex');
                          print('Name: ${_nameController.text}');
                          print('Email: ${_emailController.text}');
                          context.read<AuthBloc>().add(
                            RegisterEvent(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              password: _passwordController.text,
                              phone: _phoneController.text.trim(),
                              avatarIndex: _selectedAvatarIndex,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already Have Account ?',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Text(
                            ' Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                              color: Color(0xFFFFBB3B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Center(child: SvgPicture.asset('assets/icons/Language Switch.svg')),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}