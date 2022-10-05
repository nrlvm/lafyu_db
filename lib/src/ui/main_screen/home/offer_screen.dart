import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/home_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/model/super_flash_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/home_sale/home_sale_widget.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';
import 'package:lesson_11/src/widget/super_flash_sale/super_flash_widget.dart';

class OfferScreen extends StatefulWidget {
  final int id;
  final List<FlashSaleResult> data;
  final SuperFlashModelResult superFlashModelResult;

  const OfferScreen({
    Key? key,
    required this.id,
    required this.data,
    required this.superFlashModelResult,
  }) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  final int _gridCount = 2;

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.white,
        centerTitle: false,
        elevation: 1,
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
              'Super Flash Sale',
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
      body: ListView(
        children: [
          SizedBox(
            height: 16 * h,
          ),
          SuperFlashWidget(
            data: widget.superFlashModelResult,
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
                          child: index * _gridCount + 1 >= widget.data.length
                              ? Container()
                              : HomeSaleWidget(
                                  data: widget.data[index * _gridCount],
                                ),
                        ),
                        SizedBox(
                          width: 13 * w,
                        ),
                        Expanded(
                          child: index * _gridCount + 1 >= widget.data.length
                              ? Container()
                              : HomeSaleWidget(
                                  data: widget.data[index * _gridCount + 1],
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
              itemCount: (widget.data.length + _gridCount - 1) ~/ _gridCount,
            ),
          )
        ],
      ),
    );
  }
}
