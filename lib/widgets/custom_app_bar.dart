import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_comments_assignment/screens/login_screen.dart';
import 'package:user_comments_assignment/services/firebase_auth_service.dart';

/// The `CustomAppBar` class in Dart represents a customizable app bar with dynamic styling based on
/// authentication status.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isAuthPage;
  const CustomAppBar({required this.title, this.isAuthPage = false, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          isAuthPage ? const Color(0xFFF5F9FD) : const Color(0xFF0C54BE),
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(
          fontSize: isAuthPage ? 20 : 18,
          fontWeight: FontWeight.bold,
          color: isAuthPage ? const Color(0xFF0C54BE) : const Color(0xFFF5F9FD),
        ),
      ),
      actions: !isAuthPage
          ? [
              IconButton(
                icon: const Icon(Icons.logout),
                color: const Color(0xFFF5F9FD),
                tooltip: 'Logout',
                onPressed: () async {
                  final authService = context.read<FirebaseAuthService>();
                  await authService.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
