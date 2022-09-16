import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/product_detail_model.dart';
import 'package:lesson_11/src/utils/utils.dart';

class SelectColorWidget extends StatelessWidget {
  final Colore data;
  final bool selected;
  final Function() onTap;

  const SelectColorWidget({
    Key? key,
    required this.data,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic color = '0xFF${data.color.replaceAll('#', '')}';
    double h = Utils.height(context);
    double w = Utils.width(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48 * h,
        width: 48 * h,
        margin: EdgeInsets.only(right: 16 * w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(66),
          color: Color(
            int.parse(color),
          ),
        ),
        child: selected
            ? Center(
                child: Container(
                  height: 16 * h,
                  width: 16 * h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.white
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
