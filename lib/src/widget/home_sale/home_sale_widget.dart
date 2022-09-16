import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/ui/product/product_detail_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';

class HomeSaleWidget extends StatelessWidget {
  final FlashSaleResult data;

  const HomeSaleWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailScreen(id: data.id, name: data.name,);
            },
          ),
        );
      },
      child: Container(
        height: 282 * h,
        width: 165 * w,
        padding: EdgeInsets.symmetric(
          horizontal: 16 * w,
          vertical: 16 * h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColor.light,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 133 * h,
              width: 133 * h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  data.images.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Expanded(
              child: Text(
                data.name,
                // overflow: TextOverflow.ellipsis,
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
            SizedBox(
              height: 4 * h,
            ),
            data.reviewAvg == 0
                ? SizedBox(
                    height: 12 * h,
                  )
                : Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 12 * h,
                        width: 12 * h,
                        color: data.reviewAvg >= 0.6
                            ? AppColor.yellow
                            : AppColor.light,
                      ),
                      SizedBox(
                        width: 2 * w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 12 * h,
                        width: 12 * h,
                        color: data.reviewAvg >= 1.6
                            ? AppColor.yellow
                            : AppColor.light,
                      ),
                      SizedBox(
                        width: 2 * w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 12 * h,
                        width: 12 * h,
                        color: data.reviewAvg >= 2.6
                            ? AppColor.yellow
                            : AppColor.light,
                      ),
                      SizedBox(
                        width: 2 * w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 12 * h,
                        width: 12 * h,
                        color: data.reviewAvg >= 3.6
                            ? AppColor.yellow
                            : AppColor.light,
                      ),
                      SizedBox(
                        width: 2 * w,
                      ),
                      SvgPicture.asset(
                        'assets/icons/star.svg',
                        height: 12 * h,
                        width: 12 * h,
                        color: data.reviewAvg >= 4.6
                            ? AppColor.yellow
                            : AppColor.light,
                      ),
                      SizedBox(
                        width: 2 * w,
                      ),
                    ],
                  ),
            SizedBox(
              height: 16 * h,
            ),
            Text(
              '\$${data.price}',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 12 * h,
                height: 21.6 / 12,
                letterSpacing: 0.5,
                color: AppColor.blue,
              ),
            ),
            SizedBox(
              height: 4 * h,
            ),
            Row(
              children: [
                Text(
                  '\$${data.discountPrice}',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 10 * h,
                    height: 15 / 10,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                SizedBox(
                  width: 8 * w,
                ),
                Text(
                  '${((data.discountPrice - data.price) * 100 / data.discountPrice).toStringAsFixed(0)}% Off',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 10 * h,
                    height: 15 / 10,
                    letterSpacing: 0.5,
                    color: AppColor.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
