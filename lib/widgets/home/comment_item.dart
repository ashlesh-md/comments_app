import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_comments_assignment/constants.dart';
import 'package:user_comments_assignment/widgets/home/user_details.dart';

/// The `CommentItem` class in Dart represents a widget for displaying a comment with user details and
/// styling.

class CommentItem extends StatelessWidget {
  final String avatarLetter;
  final String name;
  final String email;
  final String comment;

  const CommentItem({
    required this.avatarLetter,
    required this.name,
    required this.email,
    required this.comment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: surfaceColor.withOpacity(0.1),
            offset: const Offset(0, 3),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 23,
            backgroundColor: getColorForLetter(name[0]),
            child: Text(
              avatarLetter.toUpperCase(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: customColorScheme.background,
                fontWeight: FontWeight.w700,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserDetails(name: name, email: email),
                const SizedBox(height: 10),
                Text(
                  comment,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
