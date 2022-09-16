import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';

class ProfileWidget extends StatelessWidget {
  final String icon;
  final String text;
  final String result;

  const ProfileWidget(
      {Key? key, required this.icon, required this.text, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Container(
      height: 54 * h,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.symmetric(horizontal: 16 * w),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/$icon'),
          SizedBox(
            width: 16 * w,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 12 * h,
              height: 18 / 12,
              letterSpacing: 0.5,
              color: AppColor.dark,
            ),
          ),
          Expanded(
            child: Text(
              result,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 12 * h,
                height: 18 / 12,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
          ),
          SizedBox(
            width: 16 * w,
          ),
          SvgPicture.asset('assets/icons/right.svg'),
        ],
      ),
    );
  }
}
