import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/ui/main_screen/cart/cart_screen.dart';
import 'package:lesson_11/src/ui/main_screen/explore/explore_screen.dart';
import 'package:lesson_11/src/ui/main_screen/home/home_screen.dart';
import 'package:lesson_11/src/ui/main_screen/offer/offer_screen_main.dart';
import 'package:lesson_11/src/utils/utils.dart';

import 'account/account_screen.dart';

class MainScreen extends StatefulWidget {

  const MainScreen({Key? key,}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // bool k = false;
  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return Scaffold(
      body: [
        const HomeScreen(),
        const ExploreScreen(),
        const CartScreen(),
        const OfferScreenMain(),
        const AccountScreen(),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.grey,
        selectedLabelStyle: TextStyle(
          fontFamily: AppColor.fontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 10 * h,
          height: 15 / 10,
          letterSpacing: 0.5,
          color: AppColor.blue,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: AppColor.fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 10 * h,
          height: 15 / 10,
          letterSpacing: 0.5,
          color: AppColor.grey,
        ),
        onTap: (index) {
          _selectedIndex = index;
          // k = true;
          setState(() {});
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/bottomBarIcon/home.svg',
              color: _selectedIndex == 0 ? AppColor.blue : AppColor.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/bottomBarIcon/search.svg',
                color: _selectedIndex == 1 ? AppColor.blue : AppColor.grey,
              ),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/bottomBarIcon/cart.svg',
                color: _selectedIndex == 2 ? AppColor.blue : AppColor.grey,
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/bottomBarIcon/offer.svg',
                color: _selectedIndex == 3 ? AppColor.blue : AppColor.grey,
              ),
              label: 'Offer'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/bottomBarIcon/user.svg',
                color: _selectedIndex == 4 ? AppColor.blue : AppColor.grey,
              ),
              label: 'Account'),
        ],
      ),
    );
  }
}
