import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/order_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/get_orders_model.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/order_widget.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';
import 'package:lottie/lottie.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    orderBloc.allOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
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
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          'Order',
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 20 * h,
            color: AppColor.dark,
          ),
        ),
      ),
      body: StreamBuilder<GetOrderModel>(
        stream: orderBloc.getOrders,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<GetOrderModelResult> data = snapshot.data!.results;
            return data.isNotEmpty
                ? ListView.builder(
                    itemCount: data.length,
                    padding: EdgeInsets.only(
                      top: 16 * h,
                      bottom: Platform.isIOS ? 24 * h : 16 * h,
                    ),
                    itemBuilder: (context, index) => OrderWidget(
                      data: data[index],
                    ),
                  )
                : Center(
                    child: Lottie.asset('assets/lottie/order.json'),
                  );
          } else {
            return const ScreenShimmer();
          }
        },
      ),
    );
  }
}
