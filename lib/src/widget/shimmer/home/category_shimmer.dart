import 'package:flutter/cupertino.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class HomeCategoryShimmer extends StatelessWidget {
  const HomeCategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Container(
        height: 108 * h,
        width: 70 * w,
        margin: EdgeInsets.symmetric(
          horizontal: 16 * w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.white,
        ),
      ),
    );
  }
}
