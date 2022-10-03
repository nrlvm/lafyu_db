import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';

class StarReviewWidget extends StatelessWidget {
  const StarReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Container(
      padding: EdgeInsets.only(top: 16 * h, bottom: 20 * h),
      height: 86 * h,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 16 * w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 16 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.blue.withOpacity(0.2),
            ),
            child: Center(
              child: Text(
                'All Review',
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColor.blue,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12 * w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 16 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColor.light,
                width: 2
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/star_y.svg',
                  height: 16 * h,
                  width: 16 * h,
                ),
                Text(
                  '  1',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 12 * h,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12 * w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 16 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: AppColor.light,
                  width: 2
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/star_y.svg',
                  height: 16 * h,
                  width: 16 * h,
                ),
                Text(
                  '  2',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 12 * h,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12 * w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 16 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: AppColor.light,
                  width: 2
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/star_y.svg',
                  height: 16 * h,
                  width: 16 * h,
                ),
                Text(
                  '  3',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 12 * h,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12 * w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 16 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: AppColor.light,
                  width: 2
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/star_y.svg',
                  height: 16 * h,
                  width: 16 * h,
                ),
                Text(
                  '  4',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 12 * h,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12 * w,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 16 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: AppColor.light,
                  width: 2
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/star_y.svg',
                  height: 16 * h,
                  width: 16 * h,
                ),
                Text(
                  '  5',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 12 * h,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12 * w,
          ),
        ],
      ),
    );
  }
}
