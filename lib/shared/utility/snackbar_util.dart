import 'package:flutter/material.dart';

///[SnackBarUtil] class contain snackBar logic
class SnackBarUtil {
  static void showSnackBars(BuildContext context, String msg,
      {Color bgColor = Colors.red}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: bgColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
