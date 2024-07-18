import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_comments_assignment/screens/home_screen.dart';
import 'package:user_comments_assignment/constants.dart';
import 'package:user_comments_assignment/providers/comment_provider.dart';
import 'package:user_comments_assignment/screens/signup_screen.dart';
import 'package:user_comments_assignment/services/firebase_auth_service.dart';
import 'firebase_options.dart';

/// The main function initializes Firebase, sets preferred device orientation, and sets up providers for
/// the Flutter app, with the MaterialApp displaying either the HomeScreen or SignupScreen based on the
/// user's authentication state.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CommentProvider()),
        Provider(create: (_) => FirebaseAuthService()),
      ],
      child: const MainApp(),
    ),
  );
}

/// The MainApp class in Dart sets up the MaterialApp with custom theme and initial home screen.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: customColorScheme,
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const AuthenticationWrapper(),
    );
  }
}

/// The `AuthenticationWrapper` class in Dart is responsible for managing the authentication state and
/// displaying either the HomeScreen or SignupScreen based on the user's authentication status.
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<FirebaseAuthService>();

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData && snapshot.data != null) {
          return const HomeScreen();
        } else {
          return const SignupScreen();
        }
      },
    );
  }
}
