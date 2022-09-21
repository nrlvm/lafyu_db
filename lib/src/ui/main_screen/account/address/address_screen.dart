import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/address_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/address_model.dart';
import 'package:lesson_11/src/ui/main_screen/account/address/add_address_screen.dart';
import 'package:lesson_11/src/ui/main_screen/account/address/edit_address_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/account/address_widget.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({Key? key}) : super(key: key);

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
              'Addresses',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 16 * h,
                height: 24 / 16,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            )
          ],
        ),
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
                SizedBox(
                  height: 16 * h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return AddressWidget(
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
                              builder: (context) => EditAddressScreen(
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddAddressScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 56 * h,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 16 * w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.blue,
                    ),
                    child: Center(
                      child: Text(
                        'Add Address',
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
                  height: 56 * h,
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
