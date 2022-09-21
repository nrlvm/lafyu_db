import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/ui/product/product_detail_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/app/custom_network_image.dart';

class FlashSaleWidget extends StatelessWidget {
  final FlashSaleResult data;

  const FlashSaleWidget({Key? key, required this.data}) : super(key: key);

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
              return ProductDetailScreen(
                id: data.id,
                name: data.name,
              );
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * w,
          vertical: 16 * h,
        ),
        height: 240 * h,
        width: 141 * w,
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
              height: 109 * h,
              width: 109 * h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CustomNetworkImage(
                  image: data.images.image,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Expanded(
              child: Text(
                data.name,
                style: TextStyle(
                  // overflow: TextOverflow.ellipsis,
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
              height: 8 * h,
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
              height: 8 * h,
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
