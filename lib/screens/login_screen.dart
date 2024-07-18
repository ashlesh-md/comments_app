import 'package:flutter/material.dart';
import 'package:user_comments_assignment/screens/home_screen.dart';
import 'package:user_comments_assignment/screens/signup_screen.dart';
import 'package:user_comments_assignment/services/firebase_auth_service.dart';
import 'package:user_comments_assignment/validators/email_validator.dart';
import 'package:user_comments_assignment/validators/password_validator.dart';
import 'package:user_comments_assignment/widgets/custom_app_bar.dart';
import 'package:user_comments_assignment/widgets/custom_button.dart';
import 'package:user_comments_assignment/widgets/custom_text_field.dart';
import 'package:user_comments_assignment/widgets/navigation_link.dart';
import 'package:user_comments_assignment/widgets/toast.dart';

/// The `LoginScreen` class in Dart represents a screen for user login functionality with email and
/// password fields.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthService _authService = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'Comments', isAuthPage: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
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
                text: 'Login',
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();

                    var user = await _authService.signInWithEmailAndPassword(
                        email, password);
                    if (user != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    } else {
                      showToast(message: 'Failed to sign in.');
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
              const NavigationLink(
                text: 'New here? ',
                linkText: 'Sign Up',
                child: SignupScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
