import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/product_detail_model.dart';
import 'package:lesson_11/src/utils/utils.dart';

class CartWidget extends StatelessWidget {
  final ProductDetailModel data;
  final Function() plus;
  final Function() minus;
  const CartWidget({Key? key, required this.data, required this.plus, required this.minus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Container(
      height: 104 * h,
      width: MediaQuery
          .of(context)
          .size
          .width,
      padding: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 16 * h),
      margin: EdgeInsets.only(
        left: 16 * w,
        right: 16 * w,
        top: 16 * h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColor.light,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Image.network(
            data.images[0].image,
            height: 72 * h,
            width: 72 * h,
            fit: BoxFit.fill,
          ),
          SizedBox(
            width: 12 * w,
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      data.name,
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        height: 18 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/love.svg',
                    height: 24 * h,
                    width: 24 * h,
                  ),
                  SizedBox(
                    width: 8 * w,
                  ),
                  SvgPicture.asset(
                    'assets/icons/trash.svg',
                    height: 24 * h,
                    width: 24 * h,
                  ),
                ],
              ),
              SizedBox(
                height: 12 * h,
              ),
              Row(
                children: [
                  Text(
                    data.price.toStringAsFixed(2),
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 12 * h,
                      height: 18 / 12,
                      letterSpacing: 0.5,
                      color: AppColor.blue,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: minus,
                    child: Container(
                      height: 24 * h,
                      width: 32 * w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        border: Border.all(
                          color: AppColor.light,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/minus.svg',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 24 * h,
                    width: 40 * w,
                    color: AppColor.light,
                    child: Text(
                      counter.toString(),
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 12 * h,
                        height: 18 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: plus,
                    child: Container(
                      height: 24 * h,
                      width: 32 * w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        border: Border.all(
                          color: AppColor.light,
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/minus.svg',
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
