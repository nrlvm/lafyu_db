import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/flash_sale/flash_sale_widget.dart';
import 'package:lesson_11/src/colors/app_color.dart';

class ProductsScreen extends StatefulWidget {
  final String title;
  final List<FlashSaleResult> type;

  const ProductsScreen({
    Key? key,
    required this.title,
    required this.type,
  }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final _gridCount = 2;

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
          widget.title,
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 20 * h,
            color: AppColor.dark,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(left: 16 * w, right: 16 * w, top: 16 * h),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: index * _gridCount >= widget.type.length
                        ? Container()
                        : FlashSaleWidget(
                            data: widget.type[index],
                          ),
                  ),
                  SizedBox(
                    width: 13 * w,
                  ),
                  Expanded(
                    child: index * _gridCount + 1 >= widget.type.length
                        ? Container()
                        : FlashSaleWidget(
                            data: widget.type[index * _gridCount + 1],
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
        itemCount: (widget.type.length + _gridCount + 1) ~/ _gridCount,
      ),
    );
  }
}
