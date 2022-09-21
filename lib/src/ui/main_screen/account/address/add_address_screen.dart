import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/address_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/address_model.dart';
import 'package:lesson_11/src/utils/utils.dart';

class AddAddressScreen extends StatefulWidget {
  final AddressModel? data;

  const AddAddressScreen({Key? key, this.data}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              width: 12 * h,
            ),
            Text(
              'Add Address',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 * w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16 * h,
            ),
            Text(
              'Name',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 14 * h,
                height: 21 / 14,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
            SizedBox(
              height: 12 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56 * h,
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.light,
                ),
              ),
              child: Center(
                child: TextField(
                  controller: name,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 12 * h,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24 * h,
            ),
            Text(
              'Phone Number',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 14 * h,
                height: 21 / 14,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
            SizedBox(
              height: 12 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56 * h,
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.light,
                ),
              ),
              child: Center(
                child: TextField(
                  controller: phoneNumber,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 12 * h,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 24 * h,
            ),
            Text(
              'Address',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 14 * h,
                height: 21 / 14,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
            SizedBox(
              height: 12 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56 * h,
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.light,
                ),
              ),
              child: Center(
                child: TextField(
                  controller: address,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 12 * h,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                if (name.text.isNotEmpty &&
                    address.text.isNotEmpty &&
                    phoneNumber.text.isNotEmpty) {
                  await addressBloc.saveAddress(
                    AddressModel(
                      name: name.text,
                      pNumber: phoneNumber.text,
                      location: address.text,
                    ),
                  );
                  Navigator.pop(this.context);
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 56 * h,
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
                      height: 25 / 14,
                      letterSpacing: 0.5,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 56 * h,
            )
          ],
        ),
      ),
    );
  }
}
