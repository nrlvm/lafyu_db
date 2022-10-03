import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/home_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/category_model.dart';
import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/model/home_model.dart';
import 'package:lesson_11/src/model/super_flash_model.dart';
import 'package:lesson_11/src/ui/main_screen/favorite/favorite_screen.dart';
import 'package:lesson_11/src/ui/main_screen/home/offer_screen.dart';
import 'package:lesson_11/src/ui/main_screen/home/products_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/category/category_widget.dart';
import 'package:lesson_11/src/widget/flash_sale/flash_sale_widget.dart';
import 'package:lesson_11/src/widget/home_sale/home_sale_widget.dart';
import 'package:lesson_11/src/widget/shimmer/home/banner_shimmer.dart';
import 'package:lesson_11/src/widget/shimmer/home/category_shimmer.dart';
import 'package:lesson_11/src/widget/shimmer/home/flash_shimmer.dart';
import 'package:lesson_11/src/widget/shimmer/home/home_sale_shimmer.dart';
import 'package:lesson_11/src/widget/super_flash_sale/super_flash_widget.dart';

class HomeScreen extends StatefulWidget {
  final Function(int id) change;

  const HomeScreen({
    Key? key,
    required this.change,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _gridcount = 2;

  PageController controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    homeBlock.allHomeData();
    currentPage = 0;
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 20 * h,
            color: AppColor.dark,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteScreen(),
                ),
              );
            },
            child: Container(
              color: Colors.transparent,
              width: 56 * h,
              child: SvgPicture.asset(
                'assets/icons/love.svg',
                fit: BoxFit.none,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<HomeModel>(
        stream: homeBlock.getHome,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            HomeModel data = snapshot.data!;
            SuperFlashModel superFlashModel = data.superFlashModel;
            CategoryModel categoryModel = data.categoryModel;
            FlashSaleModel flashSaleModel = data.flashSaleModel;
            FlashSaleModel megaSaleModel = data.megaSaleModel;
            FlashSaleModel homeSaleModel = data.homeSaleModel;
            return ListView(
              children: [
                SizedBox(
                  height: 16 * h,
                ),
                SizedBox(
                  height: 206 * h,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    controller: controller,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OfferScreen(
                                  id: superFlashModel.results[index].id,
                                );
                              },
                            ),
                          );
                        },
                        child: SuperFlashWidget(
                          data: superFlashModel.results[index],
                        ),
                      );
                    },
                    itemCount: superFlashModel.results.length,
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
                        color:
                            currentPage == 0 ? AppColor.blue : AppColor.light,
                      ),
                    ),
                    SizedBox(
                      width: 8 * w,
                    ),
                    Container(
                      height: 8 * h,
                      width: 8 * h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            currentPage == 1 ? AppColor.blue : AppColor.light,
                      ),
                    ),
                    SizedBox(
                      width: 8 * w,
                    ),
                    Container(
                      height: 8 * h,
                      width: 8 * h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            currentPage == 2 ? AppColor.blue : AppColor.light,
                      ),
                    ),
                    SizedBox(
                      width: 8 * w,
                    ),
                    Container(
                      height: 8 * h,
                      width: 8 * h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            currentPage == 3 ? AppColor.blue : AppColor.light,
                      ),
                    ),
                    SizedBox(
                      width: 8 * w,
                    ),
                    Container(
                      height: 8 * h,
                      width: 8 * h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            currentPage == 4 ? AppColor.blue : AppColor.light,
                      ),
                    ),
                  ],
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
                        'Category',
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
                          widget.change(1);
                        },
                        child: Text(
                          'More Category',
                          style: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 14 * h,
                            height: 21 / 14,
                            letterSpacing: 0.5,
                            color: AppColor.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 144 * h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 16 * w, right: 4 * w),
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryModel.results.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CategoryWidget(data: categoryModel.results[index]),
                          SizedBox(
                            width: 12 * w,
                          )
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16 * w,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Flash Sale',
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
                              builder: (context) => ProductsScreen(
                                title: "Flash Sale",
                                type: flashSaleModel.results,
                              ),
                            ),
                          );
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
                  height: 274 * h,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      left: 16 * h,
                    ),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          FlashSaleWidget(data: flashSaleModel.results[index]),
                          SizedBox(
                            width: 16 * w,
                          ),
                        ],
                      );
                    },
                    itemCount: flashSaleModel.results.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16 * w,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Mega Sale',
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
                              builder: (context) => ProductsScreen(
                                title: 'Mega Sale',
                                type: megaSaleModel.results,
                              ),
                            ),
                          );
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
                  height: 274 * h,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      left: 16 * h,
                    ),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          FlashSaleWidget(data: megaSaleModel.results[index]),
                          SizedBox(
                            width: 16 * w,
                          ),
                        ],
                      );
                    },
                    itemCount: megaSaleModel.results.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 206 * h,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    controller: controller,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OfferScreen(
                                  id: superFlashModel.results[index].id,
                                );
                              },
                            ),
                          );
                        },
                        child: SuperFlashWidget(
                          data: superFlashModel.results[index],
                        ),
                      );
                    },
                    itemCount: superFlashModel.results.length,
                  ),
                ),
                SizedBox(
                  height: 16 * h,
                ),
                SizedBox(
                  height: 606 * h,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: HomeSaleWidget(
                                  data:
                                      homeSaleModel.results[index * _gridcount],
                                ),
                              ),
                              SizedBox(
                                width: 13 * w,
                              ),
                              Expanded(
                                child: HomeSaleWidget(
                                  data: homeSaleModel
                                      .results[index * _gridcount + 1],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12 * h,
                          )
                        ],
                      );
                    },
                    padding: EdgeInsets.symmetric(horizontal: 16 * w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeSaleModel.results.length ~/ 2,
                  ),
                )
              ],
            );
          }
          return ListView(
            children: [
              SizedBox(
                height: 16 * h,
              ),
              const BannerShimmer(),
              SizedBox(
                height: 60 * h,
              ),
              const HomeCategoryShimmer(),
              SizedBox(
                height: 36 * h,
              ),
              const FlashSaleShimmer(),
              SizedBox(
                height: 24 * h,
              ),
              const FlashSaleShimmer(),
              SizedBox(
                height: 16 * h,
              ),
              const BannerShimmer(),
              SizedBox(
                height: 16 * h,
              ),
              const HomeSaleShimmer(),
              SizedBox(
                height: 16 * h,
              )
            ],
          );
        },
      ),
    );
  }
}
