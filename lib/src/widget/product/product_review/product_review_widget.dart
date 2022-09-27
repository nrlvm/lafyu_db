import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/product_detail_model.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/app/custom_network_image.dart';

class ProductReviewWidget extends StatelessWidget {
  final Review data;

  const ProductReviewWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16 * w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 48 * h,
                width: 48 * h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(48),
                  child: CustomNetworkImage(
                    image: data.user.avatar,
                    boxFit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: 16 * w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${data.user.firstName} ${data.user.lastName}',
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * h,
                      height: 21 / 14,
                      letterSpacing: 0.5,
                      color: AppColor.dark,
                    ),
                  ),
                  SizedBox(
                    height: 4 * h,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 16 * h,
                        width: 16 * h,
                        color:
                            data.start > 0.6 ? AppColor.yellow : AppColor.light,
                      ),
                      SizedBox(
                        width: 4 * w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 16 * h,
                        width: 16 * h,
                        color:
                            data.start > 1.6 ? AppColor.yellow : AppColor.light,
                      ),
                      SizedBox(
                        width: 4 * w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 16 * h,
                        width: 16 * h,
                        color:
                            data.start > 2.6 ? AppColor.yellow : AppColor.light,
                      ),
                      SizedBox(
                        width: 4 * w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 16 * h,
                        width: 16 * h,
                        color:
                            data.start > 3.6 ? AppColor.yellow : AppColor.light,
                      ),
                      SizedBox(
                        width: 4 * w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 16 * h,
                        width: 16 * h,
                        color:
                            data.start > 4.6 ? AppColor.yellow : AppColor.light,
                      ),
                      SizedBox(
                        width: 4 * w,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 16 * h,
          ),
          Text(
            data.text,
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 12 * h,
              height: 21.6 / 12,
              letterSpacing: 0.5,
              color: AppColor.grey,
            ),
          ),
          data.images == 0
              ? SizedBox(
                  height: 16 * h,
                )
              : SizedBox(
                  height: 104 * h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CustomNetworkImage(
                              image: data.images[index],
                            ),
                          ),
                          SizedBox(
                            width: 12 * w,
                          ),
                        ],
                      );
                    },
                    itemCount: data.images,
                  ),
                ),
          Text(
            '${data.date.day} ${data.date.month} ${data.date.year}',
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 10 * h,
              height: 15 / 10,
              letterSpacing: 0.5,
              color: AppColor.grey,
            ),
          ),
        ],
      ),
    );
  }
}
