import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/address_model.dart';
import 'package:lesson_11/src/utils/utils.dart';

class AddressWidget extends StatelessWidget {
  final AddressModel data;
  final bool isSelected;
  final Function() onTap;
  final Function() edit;
  final Function() delete;

  const AddressWidget({
    Key? key,
    required this.data,
    required this.isSelected,
    required this.onTap,
    required this.edit,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240 * h,
        padding: EdgeInsets.symmetric(horizontal: 24 * w, vertical: 24 * h),
        margin: EdgeInsets.only(left: 16 * w,right: 16 * w,bottom: 16 * h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? AppColor.blue : AppColor.light,
            width: 2
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name,
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
              height: 16 * h,
            ),
            Expanded(
              child: Text(
                data.location,
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 12 * h,
                  height: 21.6 / 12,
                  letterSpacing: 0.5,
                  color: AppColor.grey,
                ),
              ),
            ),
            SizedBox(
              height: 16 * h,
            ),
            Text(
              data.pNumber,
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 12 * h,
                height: 21.6 / 12,
                letterSpacing: 0.5,
                color: AppColor.grey,
              ),
            ),
            SizedBox(
              height: 16 * h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    edit();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24 * h,
                      vertical: 16 * h,
                    ),
                    color: AppColor.blue,
                    child: Center(
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 14 * h,
                          height: 25.2 / 14,
                          letterSpacing: 0.5,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24 * w,
                ),
                GestureDetector(
                  onTap: () {
                    delete();
                  },
                  child: SvgPicture.asset('assets/icons/trash.svg'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
