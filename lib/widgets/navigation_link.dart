import 'package:flutter/material.dart';
import 'package:user_comments_assignment/constants.dart';

/// The `NavigationLink` class in Dart represents a widget that displays text and a clickable link,
/// allowing navigation within an app.
class NavigationLink extends StatelessWidget {
  final String text;
  final String linkText;
  final Widget? child;

  const NavigationLink({
    required this.text,
    required this.linkText,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        GestureDetector(
          onTap: () {
            if (child == null) {
              Navigator.pop(context);
            } else {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      child!,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    final tween = Tween(begin: begin, end: end);
                    final curvedAnimation = CurvedAnimation(
                      parent: animation,
                      curve: curve,
                    );
                    return SlideTransition(
                      position: tween.animate(curvedAnimation),
                      child: child,
                    );
                  },
                ),
              );
            }
          },
          child: Text(
            linkText,
            style: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
