import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/favorite_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/favorite_model.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/favorite/favorite_widget.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final int _gridCount = 2;

  @override
  void initState() {
    favoriteBloc.allFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/left.svg',
              ),
            ),
            SizedBox(
              width: 12 * w,
            ),
            Text(
              'Favorite Product',
              // textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 16 * h,
                height: 24 / 16,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<FavoriteModel>>(
        stream: favoriteBloc.getFavorite,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<FavoriteModel> data = snapshot.data!;
            print(data.length);
            return ListView(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: index * _gridCount >= data.length
                                  ? Container()
                                  : FavoriteWidget(
                                      data: data[index * _gridCount],
                                    ),
                            ),
                            SizedBox(
                              width: 13 * w,
                            ),
                            Expanded(
                              child: index * _gridCount + 1 >= data.length
                                  ? Container()
                                  : FavoriteWidget(
                                      data: data[index * _gridCount + 1],
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
                  padding: EdgeInsets.only(
                    left: 16 * w,
                    right: 16 * w,
                    top: 16 * h,
                  ),
                  shrinkWrap: true,
                  itemCount: (data.length + _gridCount + 1) ~/ _gridCount,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            );
          }
          return const ScreenShimmer();
        },
      ),
    );
  }
}
