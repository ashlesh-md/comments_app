import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:user_comments_assignment/constants.dart';

/// The `showToast` function displays a toast message with the provided message text at the bottom of
/// the screen.
///
/// Args:
///   message (String): The `message` parameter is a required parameter of type `String` that represents
/// the text message to be displayed in the toast notification.
void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
