import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';

class CenterDialog {
  static void showErrorDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            "Error",
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontSize: 18,
              color: AppColor.dark,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
          content: Text(
            msg,
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontSize: 16,
              color: AppColor.grey,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.transparent,
                height: 44,
                child: Center(
                  child: Text(
                    "ok",
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontSize: 16,
                      color: AppColor.dark,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
