import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/review_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/product_detail_model.dart';
import 'package:lesson_11/src/model/review_model.dart';
import 'package:lesson_11/src/ui/review/add_review_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/product/product_review/product_review_widget.dart';
import 'package:lesson_11/src/widget/product/product_review/star_review_widget.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';

class ReviewScreen extends StatefulWidget {
  final int id;

  const ReviewScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    reviewBloc.allReviews(widget.id);
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
        title: Text(
          'Reviews',
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 20 * h,
            color: AppColor.dark,
          ),
        ),
      ),
      body: StreamBuilder<ReviewListModel>(
        stream: reviewBloc.getReviews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Review> data = snapshot.data!.results;
            return Column(
              children: [
                const StarReviewWidget(),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ProductReviewWidget(
                          data: data[index],
                        ),
                        SizedBox(
                          height: 24 * h,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddReviewScreen(
                          productId: widget.id,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 56 * h,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      left: 16 * w,
                      right: 16 * w,
                      bottom: Platform.isIOS ? 24 * h : 16 * h,
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
                        'Write Review',
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
                ),
              ],
            );
          } else {
            return const ScreenShimmer();
          }
        },
      ),
    );
  }
}
