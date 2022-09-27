import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/category_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/flash_sale/flash_sale_widget.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';
import 'package:lottie/lottie.dart';

class CategoryProductsScreen extends StatefulWidget {
  final int id;
  final String title;

  const CategoryProductsScreen({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final _gridCount = 2;

  @override
  void initState() {
    categoryBlock.productsByCategoryId(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.transparent,
            child: SvgPicture.asset(
              'assets/icons/left.svg',
              fit: BoxFit.none,
            ),
          ),
        ),
        elevation: 1,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 20 * h,
            color: AppColor.dark,
          ),
        ),
      ),
      body: StreamBuilder<FlashSaleModel>(
        stream: categoryBlock.getCatProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<FlashSaleResult> data = snapshot.data!.results;
            return data.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.only(
                        left: 16 * w, right: 16 * w, top: 16 * h),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: index * _gridCount >= data.length
                                    ? Container()
                                    : FlashSaleWidget(
                                        data: data[index],
                                      ),
                              ),
                              SizedBox(
                                width: 13 * w,
                              ),
                              Expanded(
                                child: index * _gridCount + 1 >= data.length
                                    ? Container()
                                    : FlashSaleWidget(
                                        data: data[index * _gridCount + 1],
                                      ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16 * h,
                          )
                        ],
                      );
                    },
                    itemCount: (data.length + _gridCount + 1) ~/ _gridCount,
                  )
                : Center(
                  child: Lottie.asset(
                      'assets/lottie/order.json',
                    ),
                );
          } else {
            return const ScreenShimmer();
          }
        },
      ),
    );
  }
}
