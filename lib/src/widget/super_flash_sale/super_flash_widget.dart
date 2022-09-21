import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/super_flash_model.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/app/custom_network_image.dart';

class SuperFlashWidget extends StatelessWidget {
  final SuperFlashModelResult data;

  const SuperFlashWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16 * w,
      ),
      height: 206 * h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CustomNetworkImage(
              image: data.image,
              width: MediaQuery.of(context).size.width,
              boxFit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            left: 24 * w,
            top: 32 * h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data.name}\n${data.percent}% Off',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 24 * h,
                    height: 32 / 24,
                    letterSpacing: 0.5,
                    color: AppColor.white,
                  ),
                ),
                SizedBox(
                  height: 29 * h,
                ),
                Row(
                  children: [
                    Container(
                      height: 41 * h,
                      width: 42 * w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.white,
                      ),
                      child: Center(
                        child: Text(
                          data.endDate.day.toString(),
                          style: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 16 * h,
                            height: 24 / 16,
                            letterSpacing: 0.5,
                            color: AppColor.dark,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4 * w,
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 14 * h,
                        height: 21 / 14,
                        color: AppColor.white,
                      ),
                    ),
                    Container(
                      height: 41 * h,
                      width: 42 * w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.white,
                      ),
                      child: Center(
                        child: Text(
                          data.endDate.month.toString(),
                          style: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 16 * h,
                            height: 24 / 16,
                            letterSpacing: 0.5,
                            color: AppColor.dark,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4 * w,
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 14 * h,
                        height: 21 / 14,
                        color: AppColor.white,
                      ),
                    ),
                    Container(
                      height: 41 * h,
                      width: 42 * w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.white,
                      ),
                      child: Center(
                        child: Text(
                          data.endDate.day.toString(),
                          style: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 16 * h,
                            height: 24 / 16,
                            letterSpacing: 0.5,
                            color: AppColor.dark,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
