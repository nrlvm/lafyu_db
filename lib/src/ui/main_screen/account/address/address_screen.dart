import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/address_bloc.dart';
import 'package:lesson_11/src/bloc/cart_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/address_model.dart';
import 'package:lesson_11/src/model/card_model.dart';
import 'package:lesson_11/src/model/save_order_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:lesson_11/src/ui/main_screen/account/address/add_address_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/account/address_widget.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';

class AddressesScreen extends StatefulWidget {
  final bool card;
  final List<CartModel>? cartModel;

  const AddressesScreen({
    Key? key,
    this.card = false,
    this.cartModel,
  }) : super(key: key);

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  int selectedIndex = -1;

  @override
  void initState() {
    addressBloc.allAddresses();
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
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/left.svg',
              ),
            ),
          ),
        ),
        title: Text(
          'Addresses',
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w700,
            fontSize: 16 * h,
            height: 24 / 16,
            letterSpacing: 0.5,
            color: AppColor.dark,
          ),
        ),
        actions: [
          widget.card
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddAddressScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: 48 * w,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/plus.svg',
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      body: StreamBuilder<List<AddressModel>>(
        stream: addressBloc.getAddress,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AddressModel> data = snapshot.data!;
            if (data.length == 1) {
              selectedIndex = 0;
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 16 * h),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return AddressWidget(
                        canChoose: widget.card,
                        data: data[index],
                        isSelected: selectedIndex == index,
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        edit: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddAddressScreen(
                                data: data[index],
                              ),
                            ),
                          );
                        },
                        delete: () {
                          addressBloc.deleteAddress(data[index].id);
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 16 * h,
                ),
                GestureDetector(
                  onTap: () async {
                    if (widget.card &&
                        selectedIndex != -1 &&
                        widget.cartModel != null) {
                      List<Product> products = [];
                      for (int i = 0; i < widget.cartModel!.length; i++) {
                        Product pr = Product(
                          productId: widget.cartModel![i].id,
                          count: widget.cartModel![i].cardCount,
                        );
                        products.add(pr);
                      }
                      await ApiProvider().postOrder(
                        SaveOrderModel(
                          products: products,
                          phone: data[selectedIndex].pNumber,
                          city: data[selectedIndex].city,
                          location: data[selectedIndex].location,
                        ),
                        widget.cartModel!,
                      );
                      cartBloc.clearCart();
                      Navigator.pop(this.context);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddAddressScreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 48 * h,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 16 * w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.blue,
                    ),
                    child: Center(
                      child: Text(
                        widget.card ? "Buy order" : 'Add Address',
                        style: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 14 * h,
                          letterSpacing: 0.5,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Platform.isIOS ? 24 * h : 16 * h),
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
