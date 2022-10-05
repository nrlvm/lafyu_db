import 'package:flutter/material.dart';

class Utils {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width / 375;
    // return MediaQuery.of(context).size.width / 392.72727272727275;
  }

  static double height(BuildContext context) {
    /// 14 pro max
    return MediaQuery.of(context).size.height / 812;
    // return MediaQuery.of(context).size.height / 803.6363636363636;
    ///iPhone SE II
    // return MediaQuery.of(context).size.height / 667;
  }
}
