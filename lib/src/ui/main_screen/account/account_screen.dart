import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/ui/auth/login_screen.dart';
import 'package:lesson_11/src/ui/main_screen/account/address/address_screen.dart';
import 'package:lesson_11/src/ui/main_screen/account/order/order_screen.dart';
import 'package:lesson_11/src/ui/main_screen/account/profile/profile_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/account/account_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Account',
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 20 * h,
            color: AppColor.dark,
          ),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String token = prefs.getString('token') ?? "";
              if (token == "") {
                Navigator.popUntil(this.context, (route) => route.isFirst);
                Navigator.pushReplacement(
                  this.context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              } else {
                Navigator.push(
                  this.context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProfileScreen();
                    },
                  ),
                );
              }
            },
            child: const AccountWidget(
              pic: 'user.svg',
              text: 'Profile',
            ),
          ),
          GestureDetector(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              String token = prefs.getString('token') ?? "";
              if (token == "") {
                Navigator.popUntil(this.context, (route) => route.isFirst);
                Navigator.pushReplacement(
                  this.context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              } else {
                Navigator.push(
                  this.context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const OrderScreen();
                    },
                  ),
                );
              }
            },
            child: const AccountWidget(
              pic: 'bag.svg',
              text: 'Order',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddressesScreen(),
                ),
              );
            },
            child: const AccountWidget(
              pic: 'location.svg',
              text: 'Address',
            ),
          ),
        ],
      ),
    );
  }
}
