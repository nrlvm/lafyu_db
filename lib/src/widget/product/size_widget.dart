import 'package:flutter/cupertino.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';

import '../../model/product_detail_model.dart';

class SelectSizeWidget extends StatelessWidget {
  final Sizee data;
  final bool selected;
  final Function() onTap;

  const SelectSizeWidget({
    Key? key,
    required this.data,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48 * h,
          margin: EdgeInsets.only(right: 16 * w),
          width: 48 * h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            border: Border.all(
              color: selected ? AppColor.blue : AppColor.light,
            ),
          ),
          child: Center(
            child: Text(
              data.size,
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 14 * h,
                height: 21 / 14,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
