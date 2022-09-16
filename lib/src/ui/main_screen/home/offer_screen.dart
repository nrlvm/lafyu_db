import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/home_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/model/super_flash_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/home_sale/home_sale_widget.dart';
import 'package:lesson_11/src/widget/super_flash_sale/super_flash_widget.dart';

class OfferScreen extends StatefulWidget {
  final int id;

  const OfferScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  SuperFlashModelResult superFlashResult = SuperFlashModelResult.fromJson({});
  FlashSaleModel homeSaleResult = FlashSaleModel.fromJson({});
  final int _gridcount = 2;

  ApiProvider apiProvider = ApiProvider();

  @override
  initState() {
    homeBlock.allSuperFlashById(widget.id);
    homeBlock.allHomeData();
    super.initState();
  }

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
            data: SuperFlashModelResult(
              id: superFlashResult.id,
              endDate: superFlashResult.endDate,
              image: superFlashResult.image,
              name: superFlashResult.name,
              percent: superFlashResult.percent,
              product: superFlashResult.product,
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
                            data: superFlashResult.product[index * _gridcount],
                          ),
                        ),
                        SizedBox(
                          width: 13 * w,
                        ),
                        Expanded(
                          child: HomeSaleWidget(
                            data: superFlashResult.product[index * _gridcount + 1]
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
              itemCount: superFlashResult.product.length ~/ 2,
            ),
          )
        ],
      ),
    );
  }
}
