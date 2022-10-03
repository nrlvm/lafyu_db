import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/product_block.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/product_detail_model.dart';
import 'package:lesson_11/src/ui/review/review_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/app/custom_network_image.dart';
import 'package:lesson_11/src/widget/flash_sale/flash_sale_widget.dart';
import 'package:lesson_11/src/widget/product/color_widget.dart';
import 'package:lesson_11/src/widget/product/product_review/product_review_widget.dart';
import 'package:lesson_11/src/widget/product/size_widget.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';

class ProductDetailScreen extends StatefulWidget {
  final int id;
  final String name;

  const ProductDetailScreen({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;
  int _sizeSelectedId = -1;
  int _colorSelectedId = -1;

  @override
  void initState() {
    productBlock.allProductDetail(widget.id);
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return StreamBuilder<ProductDetailModel>(
      stream: productBlock.getDetail,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ProductDetailModel data = snapshot.data!;
          return Scaffold(
            backgroundColor: AppColor.white.withOpacity(0.97),
            appBar: AppBar(
              backgroundColor: AppColor.white,
              elevation: 1,
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await productBlock.updateCart(data);
                      Navigator.pop(this.context);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/left.svg',
                      height: 24 * h,
                      width: 24 * h,
                    ),
                  ),
                  SizedBox(
                    width: 12 * w,
                  ),
                  Expanded(
                    child: Text(
                      data.name,
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16 * h,
                        height: 24 / 16,
                        letterSpacing: 0.5,
                        color: AppColor.dark,
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                SvgPicture.asset(
                  'assets/icons/search_grey.svg',
                ),
                SizedBox(
                  width: 16 * w,
                ),
                SvgPicture.asset(
                  'assets/icons/more.svg',
                ),
                SizedBox(
                  width: 12 * w,
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 238 * h,
                        child: PageView.builder(
                          controller: _controller,
                          itemBuilder: (context, index) {
                            return CustomNetworkImage(
                              image: data.images[index].image,
                            );
                          },
                          itemCount: data.images.length,
                        ),
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 8 * h,
                            width: 8 * h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: currentPage == 0
                                  ? AppColor.blue
                                  : AppColor.light,
                            ),
                          ),
                          SizedBox(
                            width: 8 * w,
                          ),
                          data.images.length < 2
                              ? Container()
                              : Container(
                                  height: 8 * h,
                                  width: 8 * h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: currentPage == 1
                                        ? AppColor.blue
                                        : AppColor.light,
                                  ),
                                ),
                          SizedBox(
                            width: 8 * w,
                          ),
                          data.images.length < 3
                              ? Container()
                              : Container(
                                  height: 8 * h,
                                  width: 8 * h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: currentPage == 2
                                        ? AppColor.blue
                                        : AppColor.light,
                                  ),
                                ),
                          SizedBox(
                            width: 8 * w,
                          ),
                          data.images.length < 4
                              ? Container()
                              : Container(
                                  height: 8 * h,
                                  width: 8 * h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: currentPage == 3
                                        ? AppColor.blue
                                        : AppColor.light,
                                  ),
                                ),
                          SizedBox(
                            width: 8 * w,
                          ),
                          data.images.length < 5
                              ? Container()
                              : Container(
                                  height: 8 * h,
                                  width: 8 * h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: currentPage == 4
                                        ? AppColor.blue
                                        : AppColor.light,
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                data.name,
                                style: TextStyle(
                                  fontFamily: AppColor.fontFamily,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20 * h,
                                  height: 30 / 20,
                                  letterSpacing: 0.5,
                                  color: AppColor.dark,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16 * w,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (!data.isFavorite) {
                                  await productBlock.saveFavorite(data);
                                } else {
                                  await productBlock.deleteFavorite(data);
                                }
                              },
                              child: data.isFavorite
                                  ? SvgPicture.asset(
                                      'assets/icons/star_y.svg',
                                      height: 20 * h,
                                      width: 20 * h,
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/love.svg',
                                      color: AppColor.dark,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8 * h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 16 * h,
                              width: 16 * h,
                              color: data.reviewAvg > 0.6
                                  ? AppColor.yellow
                                  : AppColor.grey,
                            ),
                            SizedBox(
                              width: 4 * w,
                            ),
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 16 * h,
                              width: 16 * h,
                              color: data.reviewAvg > 1.6
                                  ? AppColor.yellow
                                  : AppColor.grey,
                            ),
                            SizedBox(
                              width: 4 * w,
                            ),
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 16 * h,
                              width: 16 * h,
                              color: data.reviewAvg > 2.6
                                  ? AppColor.yellow
                                  : AppColor.grey,
                            ),
                            SizedBox(
                              width: 4 * w,
                            ),
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 16 * h,
                              width: 16 * h,
                              color: data.reviewAvg > 3.6
                                  ? AppColor.yellow
                                  : AppColor.grey,
                            ),
                            SizedBox(
                              width: 4 * w,
                            ),
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 16 * h,
                              width: 16 * h,
                              color: data.reviewAvg > 4.6
                                  ? AppColor.yellow
                                  : AppColor.grey,
                            ),
                            SizedBox(
                              width: 4 * w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Text(
                          '\$${data.price}',
                          style: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 20 * h,
                            height: 30 / 20,
                            letterSpacing: 0.5,
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24 * h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Text(
                          'Select Size',
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
                      SizedBox(
                        height: 84 * h,
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 16 * w,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SelectSizeWidget(
                              data: data.size[index],
                              selected: _sizeSelectedId == data.size[index].id,
                              onTap: () {
                                setState(() {
                                  _sizeSelectedId = data.size[index].id;
                                });
                              },
                            );
                          },
                          itemCount: data.size.length,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Text(
                          'Select Color',
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
                      SizedBox(
                        height: 84 * h,
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: 16 * w,
                          ),
                          itemCount: data.color.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SelectColorWidget(
                                  data: data.color[index],
                                  selected:
                                      _colorSelectedId == data.color[index].id,
                                  onTap: () {
                                    setState(() {
                                      _colorSelectedId = data.color[index].id;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Text(
                          'Specification',
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
                      SizedBox(
                        height: 12 * h,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16 * w,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Shown',
                                      style: TextStyle(
                                        fontFamily: AppColor.fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12 * h,
                                        height: 21.6 / 12,
                                        letterSpacing: 0.5,
                                        color: AppColor.dark,
                                      ),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      child: Text(
                                        data.specification[index].shown,
                                        textAlign: TextAlign.right,
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
                                  ],
                                ),
                                SizedBox(
                                  height: 16 * h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Style',
                                      style: TextStyle(
                                        fontFamily: AppColor.fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12 * h,
                                        height: 21.6 / 12,
                                        letterSpacing: 0.5,
                                        color: AppColor.dark,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      data.specification[index].style,
                                      style: TextStyle(
                                        fontFamily: AppColor.fontFamily,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12 * h,
                                        height: 21.6 / 12,
                                        letterSpacing: 0.5,
                                        color: AppColor.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16 * h,
                                ),
                                Text(
                                  data.specification[index].textmodels,
                                  style: TextStyle(
                                    fontFamily: AppColor.fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12 * h,
                                    height: 21.6 / 12,
                                    letterSpacing: 0.5,
                                    color: AppColor.grey,
                                  ),
                                )
                              ],
                            );
                          },
                          itemCount: data.specification.length,
                        ),
                      ),
                      SizedBox(
                        height: 24 * h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Review Product',
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 14 * h,
                                height: 21 / 14,
                                letterSpacing: 0.5,
                                color: AppColor.dark,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReviewScreen(
                                      id: data.id,
                                    ),
                                  ),
                                );
                                print(data.id);
                              },
                              child: Text(
                                'See More',
                                style: TextStyle(
                                  fontFamily: AppColor.fontFamily,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14 * h,
                                  height: 21 / 14,
                                  letterSpacing: 0.5,
                                  color: AppColor.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8 * h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 16 * h,
                              width: 16 * h,
                              color: data.reviewAvg > 0.6
                                  ? AppColor.yellow
                                  : AppColor.light,
                            ),
                            SizedBox(
                              width: 4 * w,
                            ),
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 16 * h,
                              width: 16 * h,
                              color: data.reviewAvg > 1.6
                                  ? AppColor.yellow
                                  : AppColor.light,
                            ),
                            SizedBox(
                              width: 4 * w,
                            ),
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 16 * h,
                              width: 16 * h,
                              color: data.reviewAvg > 2.6
                                  ? AppColor.yellow
                                  : AppColor.light,
                            ),
                            SizedBox(
                              width: 4 * w,
                            ),
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 16 * h,
                              width: 16 * h,
                              color: data.reviewAvg > 3.6
                                  ? AppColor.yellow
                                  : AppColor.light,
                            ),
                            SizedBox(
                              width: 4 * w,
                            ),
                            SvgPicture.asset(
                              'assets/icons/star.svg',
                              height: 16 * h,
                              width: 16 * h,
                              color: data.reviewAvg > 4.6
                                  ? AppColor.yellow
                                  : AppColor.light,
                            ),
                            SizedBox(
                              width: 8 * w,
                            ),
                            Text(
                              data.reviewAvg.toStringAsFixed(1),
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 10 * h,
                                height: 15 / 10,
                                letterSpacing: 0.5,
                                color: AppColor.grey,
                              ),
                            ),
                            SizedBox(
                              width: 3 * w,
                            ),
                            Text(
                              '(${data.reviewCount} Review)',
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
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      data.reviewCount == 0
                          ? Container()
                          : ProductReviewWidget(
                              data: data.review,
                            ),
                      SizedBox(
                        height: 23 * h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16 * w,
                        ),
                        child: Text(
                          'You might also like',
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
                      data.products.isNotEmpty
                          ? SizedBox(
                              height: 274 * h,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                padding: EdgeInsets.only(
                                  left: 16 * h,
                                ),
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      FlashSaleWidget(
                                          data: data.products[index]),
                                      SizedBox(
                                        width: 16 * w,
                                      ),
                                    ],
                                  );
                                },
                                itemCount: data.products.length,
                                scrollDirection: Axis.horizontal,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16 * h,
                ),
                data.cardCount == 0
                    ? GestureDetector(
                        onTap: () {
                          productBlock.saveCart(data);
                        },
                        child: Container(
                          height: 56 * h,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(
                            horizontal: 16 * w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 30,
                                offset: const Offset(0, 10),
                                color: AppColor.blue.withOpacity(0.24),
                              ),
                            ],
                            color: AppColor.blue,
                          ),
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w700,
                                fontSize: 14 * h,
                                height: 25 / 14,
                                letterSpacing: 0.5,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: 56 * h,
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (data.cardCount > 1) {
                                  data.cardCount--;
                                  productBlock.updateCart(data);
                                } else {
                                  productBlock.deleteCart(data);
                                }
                              },
                              child: Container(
                                width: 56 * h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.blue,
                                ),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/icons/minus.svg',
                                  color: AppColor.dark,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  data.cardCount.toString(),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                data.cardCount++;
                                productBlock.updateCart(data);
                              },
                              child: Container(
                                width: 56 * h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.blue,
                                ),
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  'assets/icons/plus.svg',
                                  color: AppColor.dark,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: 28 * h,
                )
              ],
            ),
          );
        }
        return const ScreenShimmer();
      },
    );
  }
}
