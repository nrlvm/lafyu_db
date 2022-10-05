import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';

class AccountWidget extends StatelessWidget {
  final String pic;
  final String text;

  const AccountWidget({
    Key? key,
    required this.pic,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Container(
      height: 56 * h,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: 16 * h,
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/$pic'),
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
        ],
      ),
    );
  }
}
