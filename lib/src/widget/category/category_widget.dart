import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/category_model.dart';
import 'package:lesson_11/src/utils/utils.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryResult data;

  const CategoryWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return SizedBox(
      height: 108 * h,
      width: 70 * w,
      child: Column(
        children: [
          Container(
            height: 70 * w,
            width: 70 * w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              border: Border.all(
                color: AppColor.light,
              ),
            ),
            child: Center(
              child: Image.network(
                data.image,
                height: 24 * h,
                width: 24 * h,
              ),
            ),
          ),
          SizedBox(
            height: 8 * h,
          ),
          Text(
            data.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 10 * h,
              height: 15 / 10,
              letterSpacing: 0.5,
              color: AppColor.grey,
            ),
          )
        ],
      ),
    );
  }
}
