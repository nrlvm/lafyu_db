import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';

class ModalBottomSheetWidget extends StatelessWidget {
  final String errorMessage;

  const ModalBottomSheetWidget({Key? key, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 8 * h,
          ),
          Container(
            height: 5 * h,
            width: 114 * w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.grey.withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: 50 * h,
          ),
          SvgPicture.asset(
            'assets/icons/error.svg',
            height: 78 * h,
            width: 78 * h,
            color: AppColor.red,
          ),
          SizedBox(
            height: 48 * h,
          ),
          Text(
            'Sign Up Failed',
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 20 * h,
              height: 30 / 20,
              letterSpacing: 0.5,
              color: AppColor.dark,
            ),
          ),
          SizedBox(
            height: 20 * h,
          ),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 12 * h,
              height: 18 / 12,
              letterSpacing: 0.5,
              color: AppColor.grey,
            ),
          ),
          SizedBox(
            height: 58 * h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                horizontal: 16 * w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.blue,
              ),
              child: Center(
                child: Text(
                  'Try Again',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 16 * h,
                    height: 24 / 16,
                    letterSpacing: 0.5,
                    color: AppColor.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16 * h,
          )
        ],
      ),
    );
  }
}
