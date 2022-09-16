import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CenterDialog {
  static void showErrorDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Error"),
          content: Text(msg),
          actions: const [
            Text("ok"),
          ],
        );
      },
    );
  }
}
