import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/category_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/category_model.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/category/category_widget.dart';
import 'package:lesson_11/src/widget/shimmer/explore/explore_category_shimmer.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final int _gridCount = 4;


  @override
  void initState() {
    categoryBlock.allCategory();
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
        centerTitle: false,
        title: Container(
          padding: EdgeInsets.all(8 * w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColor.light),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/search_blue.svg',
                width: 16 * w,
                height: 16 * w,
              ),
              SizedBox(
                width: 8 * w,
              ),
              Expanded(
                child: Text(
                  'Search Product',
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontSize: 12 * h,
                    height: 21.6 / 12,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/love.svg',
              ),
              SizedBox(
                width: 16 * w,
              ),
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SvgPicture.asset('assets/icons/notification.svg'),
                  Container(
                    height: 8 * h,
                    width: 8 * h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4 * h),
                      color: AppColor.red,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 16 * w,
              ),
            ],
          ),
        ],
      ),
      body: StreamBuilder<CategoryModel>(
          stream: categoryBlock.getCategory,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              CategoryModel data = snapshot.data!;
              List<CategoryResult> resultsWoman = [];
              List<CategoryResult> resultsMan = [];
              for (int i = 0; i < data.results.length; i++) {
                if (data.results[i].genderTypes == 1) {
                  resultsMan.add(data.results[i]);
                } else {
                  resultsWoman.add(data.results[i]);
                }
              }
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16 * w,
                ),
                children: [
                  SizedBox(
                    height: 16 * h,
                  ),
                  Text(
                    'Man Fashion',
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
                    height: 12 * h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        (resultsMan.length + _gridCount - 1) ~/ _gridCount,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: CategoryWidget(
                              data: resultsMan[index * _gridCount],
                            ),
                          ),
                          SizedBox(width: 16 * w),
                          Expanded(
                            child: index * _gridCount + 1 >= resultsMan.length
                                ? Container()
                                : CategoryWidget(
                                    data: resultsMan[index * _gridCount + 1],
                                  ),
                          ),
                          SizedBox(width: 16 * w),
                          Expanded(
                            child: index * _gridCount + 2 >= resultsMan.length
                                ? Container()
                                : CategoryWidget(
                                    data: resultsMan[index * _gridCount + 2],
                                  ),
                          ),
                          SizedBox(width: 16 * w),
                          Expanded(
                            child: index * _gridCount + 3 >= resultsMan.length
                                ? Container()
                                : CategoryWidget(
                                    data: resultsMan[index * _gridCount + 3],
                                  ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 16 * h,
                  ),
                  Text(
                    'Woman Fashion',
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
                    height: 12 * h,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        (resultsWoman.length + _gridCount - 1) ~/ _gridCount,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: CategoryWidget(
                              data: resultsWoman[index * _gridCount],
                            ),
                          ),
                          SizedBox(width: 16 * w),
                          Expanded(
                            child: index * _gridCount + 1 >= resultsWoman.length
                                ? Container()
                                : CategoryWidget(
                                    data: resultsWoman[index * _gridCount + 1],
                                  ),
                          ),
                          SizedBox(width: 16 * w),
                          Expanded(
                            child: index * _gridCount + 2 >= resultsWoman.length
                                ? Container()
                                : CategoryWidget(
                                    data: resultsWoman[index * _gridCount + 2],
                                  ),
                          ),
                          SizedBox(width: 16 * w),
                          Expanded(
                            child: index * _gridCount + 3 >= resultsWoman.length
                                ? Container()
                                : CategoryWidget(
                                    data: resultsWoman[index * _gridCount + 3],
                                  ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              );
            }
            return const ExploreCategoryShimmer();
          }),
    );
  }
}
