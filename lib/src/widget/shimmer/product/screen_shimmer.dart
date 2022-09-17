import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class ScreenShimmer extends StatelessWidget {
  const ScreenShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // margin: EdgeInsets.symmetric(
        //   horizontal: 16 * w,
        //   vertical: 16 * h,
        // ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.white,
        ),
      ),
    );
  }
}
