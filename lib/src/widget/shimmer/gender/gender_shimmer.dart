import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class GenderShimmer extends StatelessWidget {
  const GenderShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100 * h,
        margin: EdgeInsets.symmetric(horizontal: 16 * h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.white
        ),
      ),
    );
  }
}
