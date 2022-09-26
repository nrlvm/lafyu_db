import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/category_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/category_model.dart';
import 'package:lesson_11/src/ui/main_screen/favorite/favorite_screen.dart';
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
        centerTitle: true,
        title: Text(
          'Explore',
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
