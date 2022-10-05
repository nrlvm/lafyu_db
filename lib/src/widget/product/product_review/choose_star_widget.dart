import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';

class ChooseStarWidget extends StatelessWidget {
  final int star;
  final Function() onTap1;
  final Function() onTap2;
  final Function() onTap3;
  final Function() onTap4;
  final Function() onTap5;

  const ChooseStarWidget({
    Key? key,
    required this.star,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.onTap4,
    required this.onTap5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onTap1();
          },
          child: SvgPicture.asset(
            'assets/icons/star.svg',
            height: 32 * h,
            width: 32 * h,
            color: star > 0.6 ? AppColor.yellow : AppColor.grey,
          ),
        ),
        SizedBox(
          width: 16 * w,
        ),
        GestureDetector(
          onTap: () {
            onTap2();
          },
          child: SvgPicture.asset(
            'assets/icons/star.svg',
            height: 32 * h,
            width: 32 * h,
            color: star > 1.6 ? AppColor.yellow : AppColor.grey,
          ),
        ),
        SizedBox(
          width: 16 * w,
        ),
        GestureDetector(
          onTap: () {
            onTap3();
          },
          child: SvgPicture.asset(
            'assets/icons/star.svg',
            height: 32 * h,
            width: 32 * h,
            color: star > 2.6 ? AppColor.yellow : AppColor.grey,
          ),
        ),
        SizedBox(
          width: 16 * w,
        ),
        GestureDetector(
          onTap: () {
            onTap4();
          },
          child: SvgPicture.asset(
            'assets/icons/star.svg',
            height: 32 * h,
            width: 32 * h,
            color: star > 3.6 ? AppColor.yellow : AppColor.grey,
          ),
        ),
        SizedBox(
          width: 16 * w,
        ),
        GestureDetector(
          onTap: () {
            onTap5();
          },
          child: SvgPicture.asset(
            'assets/icons/star.svg',
            height: 32 * h,
            width: 32 * h,
            color: star > 4.6 ? AppColor.yellow : AppColor.grey,
          ),
        ),
        SizedBox(
          width: 16 * w,
        ),
      ],
    );
  }
}
