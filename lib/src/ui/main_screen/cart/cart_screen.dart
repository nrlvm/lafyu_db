import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 1,
        centerTitle: false,
        title: Text(
          'Your Cart',
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 16 * h,
            height: 24 / 16,
            letterSpacing: 0.5,
            color: AppColor.dark,
          ),
        ),
      ),
      // body: ListView(
      //   children: [
      //     ListView.builder(
      //       itemBuilder: (context, index) {
      //         return CartWidget(
      //           data: data,
      //           plus: plus,
      //           minus: minus,
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
