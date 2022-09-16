import 'package:flutter/material.dart';
import 'package:lesson_11/src/bloc/cart_bloc.dart';
import 'package:lesson_11/src/bloc/product_block.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/card_model.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/cart/cart_widget.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    cartBloc.allCart();
    super.initState();
  }

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
      body: StreamBuilder<List<CartModel>>(
        stream: cartBloc.getCart,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CartModel> cartModel = snapshot.data!;
            return ListView.builder(
              itemBuilder: (context, index) {
                return CartWidget(
                  data: cartModel[index],
                  plus: () {},
                  minus: () {},
                );
              },
              itemCount: cartModel.length,
            );
          }
          return const ScreenShimmer();
        },
      ),
    );
  }
}
