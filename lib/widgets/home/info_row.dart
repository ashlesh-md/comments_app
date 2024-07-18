import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_comments_assignment/constants.dart';

/// The InfoRow class in Dart is a StatelessWidget that displays a label and a value with specified
/// styles and constraints.
class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: surfaceColor,
            fontStyle: FontStyle.italic,
            height: 1.5,
          ),
        ),
        const SizedBox(width: 8), // Add some spacing between label and value
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
            maxLines: 1, // Limits to a single line
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
