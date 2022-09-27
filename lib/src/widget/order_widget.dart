import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/get_orders_model.dart';
import 'package:lesson_11/src/utils/utils.dart';

class OrderWidget extends StatelessWidget {
  final GetOrderModelResult data;

  const OrderWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 16 * w,right: 16 * w,bottom: 16 * h),
      padding: EdgeInsets.symmetric(horizontal: 16 * w, vertical: 16 * h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColor.light,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.id.toString(),
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w700,
              fontSize: 14 * h,
              height: 21 / 14,
              color: AppColor.dark,
            ),
          ),
          SizedBox(
            height: 12 * h,
          ),
          Text(
            data.city,
            style: TextStyle(
              fontFamily: AppColor.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 12 * h,
              height: 21.6 / 12,
              color: AppColor.grey,
            ),
          ),
          SizedBox(
            height: 12 * h,
          ),
          Row(
            children: List.generate(
              20,
              (index) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5 * w),
                    child: Container(
                      height: 2,
                      width: 10,
                      color: AppColor.light,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 12 * h,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Phone',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 12 * h,
                    height: 21.6 / 12,
                    color: AppColor.grey,
                  ),
                ),
              ),
              Text(
                data.phone,
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 12 * h,
                  height: 21.6 / 12,
                  color: AppColor.dark,
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Price',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 12 * h,
                    height: 21.6 / 12,
                    color: AppColor.grey,
                  ),
                ),
              ),
              Text(
                '\$${data.price}',
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 12 * h,
                  height: 21.6 / 12,
                  color: AppColor.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
