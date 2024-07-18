import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_comments_assignment/screens/home_screen.dart';
import 'package:user_comments_assignment/screens/login_screen.dart';

import 'package:user_comments_assignment/validators/name_validator.dart';
import 'package:user_comments_assignment/validators/email_validator.dart';
import 'package:user_comments_assignment/validators/password_validator.dart';
import 'package:user_comments_assignment/widgets/custom_app_bar.dart';
import 'package:user_comments_assignment/widgets/custom_button.dart';
import 'package:user_comments_assignment/widgets/custom_text_field.dart';
import 'package:user_comments_assignment/widgets/navigation_link.dart';
import 'package:user_comments_assignment/services/firebase_auth_service.dart';

/// The `SignupScreen` class in Dart represents a screen for user sign up functionality with form
/// validation and Firebase authentication integration.
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final authService = context.read<FirebaseAuthService>();
    try {
      final user = await authService.signUpWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
      );

      if (user != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Comments',
        isAuthPage: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              CustomTextField(
                label: 'Name',
                controller: _nameController,
                validator: NameValidator.validate,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Email',
                controller: _emailController,
                validator: EmailValidator.validate,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Password',
                controller: _passwordController,
                isObscure: true,
                validator: PasswordValidator.validate,
              ),
              const Expanded(child: SizedBox()),
              CustomButton(
                text: _isLoading ? 'Signing Up...' : 'Sign Up',
                onPressed: _isLoading ? () {} : _signUp,
              ),
              const SizedBox(height: 16),
              const NavigationLink(
                text: 'Already have an account? ',
                linkText: 'Login',
                child: LoginScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
