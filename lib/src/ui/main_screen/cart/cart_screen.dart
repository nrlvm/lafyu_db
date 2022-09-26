import 'package:flutter/material.dart';
import 'package:lesson_11/src/bloc/cart_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/card_model.dart';
import 'package:lesson_11/src/ui/main_screen/account/address/address_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/cart/cart_widget.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';
import 'package:lottie/lottie.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int itemCount = 0;
  double allPrice = 0;

  @override
  void initState() {
    cartBloc.allCart();
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
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 20 * h,
            color: AppColor.dark,
          ),
        ),
      ),
      body: StreamBuilder<List<CartModel>>(
        stream: cartBloc.getCart,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CartModel> data = snapshot.data!;
            itemCount = data.length;
            allPrice = 0;
            for (int i = 0; i < data.length; i++) {
              allPrice += data[i].price * data[i].cardCount;
            }
            return data.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return data[index].cardCount > 0
                                ? CartWidget(
                                    data: data[index],
                                    plus: () {
                                      data[index].cardCount++;
                                      cartBloc.updateCart(data[index]);
                                    },
                                    minus: () {
                                      if (data[index].cardCount > 1) {
                                        data[index].cardCount--;
                                        cartBloc.updateCart(data[index]);
                                      }
                                    },
                                    delete: () {
                                      cartBloc.deleteProduct(data[index].id);
                                    },
                                    favorite: () {
                                      if (data[index].isFavorite) {
                                        cartBloc.deleteFavorite(data[index].id);
                                      } else {
                                        cartBloc.saveFavorite(data[index]);
                                      }
                                    },
                                  )
                                : const SizedBox();
                          },
                          itemCount: data.length,
                        ),
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        padding: EdgeInsets.symmetric(
                          vertical: 16 * h,
                          horizontal: 16.5 * w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColor.light),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Items ($itemCount)',
                                    style: TextStyle(
                                      fontFamily: AppColor.fontFamily,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12 * h,
                                      height: 21.6 / 12,
                                      letterSpacing: 0.5,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                ),
                                Text(
                                  '\$${allPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontFamily: AppColor.fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12 * h,
                                    height: 21.6 / 12,
                                    color: AppColor.dark,
                                    letterSpacing: 0.5,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12 * h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Delivery',
                                    style: TextStyle(
                                      fontFamily: AppColor.fontFamily,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12 * h,
                                      height: 21.6 / 12,
                                      letterSpacing: 0.5,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                ),
                                Text(
                                  '\$20.00',
                                  style: TextStyle(
                                    fontFamily: AppColor.fontFamily,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12 * h,
                                    height: 21.6 / 12,
                                    letterSpacing: 0.5,
                                    color: AppColor.dark,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 12 * h,
                            ),
                            Row(
                              children: List.generate(
                                20,
                                (index) {
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5 * w),
                                      child: Container(
                                        height: 2,
                                        width: 10,
                                        color: AppColor.light,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 12 * h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Total Price',
                                    style: TextStyle(
                                      fontFamily: AppColor.fontFamily,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12 * h,
                                      height: 18 / 12,
                                      color: AppColor.dark,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                Text(
                                  '\$${allPrice + 20}',
                                  style: TextStyle(
                                    fontFamily: AppColor.fontFamily,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12 * h,
                                    height: 18 / 12,
                                    color: AppColor.blue,
                                    letterSpacing: 0.5,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddressesScreen(
                                card: true,
                                cartModel: data,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 56 * h,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 16 * h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.blue,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 30,
                                color: AppColor.blue.withOpacity(0.24),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Check Out ',
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
                      SizedBox(
                        height: 16 * h,
                      ),
                    ],
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Lottie.asset(
                        'assets/lottie/cart.json',

                      ),
                    ),
                  );
          }
          return const ScreenShimmer();
        },
      ),
    );
  }
}
