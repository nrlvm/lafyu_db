import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/dialog/center_dialog.dart';
import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/model/login_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:lesson_11/src/ui/auth/register_screen.dart';
import 'package:lesson_11/src/ui/main_screen/main_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool privacy = false;

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 * h),
        child: Column(
          children: [
            Container(
              height: 120 * h,
              padding: EdgeInsets.only(
                top: 56 * h,
              ),
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const MainScreen();
                      },
                    ),
                  );
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 16 * h,
                    color: AppColor.grey,
                  ),
                ),
              ),
            ),
            Center(
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
              ),
            ),
            SizedBox(
              height: 16 * h,
            ),
            Text(
              'Welcome to Click to Buy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 16 * h,
                height: 24 / 16,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Text(
              'Sign in to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w400,
                fontSize: 12 * h,
                height: 21.6 / 12,
                letterSpacing: 0.5,
                color: AppColor.grey,
              ),
            ),
            SizedBox(
              height: 28 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48 * h,
              padding: EdgeInsets.symmetric(horizontal: 16 * h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.light,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/message.svg',
                    color: AppColor.grey,
                  ),
                  SizedBox(
                    width: 10 * w,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller1,
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        height: 21.6 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.grey,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Your Email',
                        hintStyle: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 12 * h,
                          height: 21.6 / 12,
                          letterSpacing: 0.5,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48 * h,
              padding: EdgeInsets.symmetric(horizontal: 16 * h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.light,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/password.svg',
                    color: AppColor.grey,
                  ),
                  SizedBox(
                    width: 10 * w,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller2,
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        height: 21.6 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.grey,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontFamily: AppColor.fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 12 * h,
                          height: 21.6 / 12,
                          letterSpacing: 0.5,
                          color: AppColor.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16 * h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      privacy = !privacy;
                    });
                  },
                  child: AnimatedContainer(
                    height: 18 * h,
                    width: 18 * h,
                    padding: EdgeInsets.all(2 * h),
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 370),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: privacy ? AppColor.blue : AppColor.grey,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/check.svg",
                      color: privacy ? AppColor.blue : AppColor.white,
                    ),
                  ),
                ),
                SizedBox(width: 8 * w),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      String url = 'https://api.osonapteka.uz/privacy';
                      if (!await launchUrl(Uri.parse(url))) {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'I have read and accept ',
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 12 * h,
                                color: AppColor.grey,
                              ),
                            ),
                            TextSpan(
                              text: 'privacy policy ',
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 12 * h,
                                color: AppColor.blue,
                              ),
                            ),
                            TextSpan(
                              text: 'and',
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 12 * h,
                                color: AppColor.grey,
                              ),
                            ),
                            TextSpan(
                              text: ' terms of use',
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w500,
                                fontSize: 12 * h,
                                color: AppColor.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                if (privacy) {
                  HttpResult response = await ApiProvider().login(
                    _controller1.text,
                    _controller2.text,
                  );
                  if (response.isSuccess) {
                    LoginModel data = LoginModel.fromJson(response.result);
                    if (data.status != 1) {
                      CenterDialog.showErrorDialog(
                        this.context,
                        data.msg,
                      );
                    }
                    if (data.status == 1) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('token', data.token);
                      Navigator.of(this.context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    }
                  } else {
                    CenterDialog.showErrorDialog(
                      this.context,
                      "Xatolik yuz berdi",
                    );
                  }
                }else{
                  CenterDialog.showErrorDialog(
                    this.context,
                    "Not selected",
                  );
                }
              },
              child: Container(
                height: 56 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.blue,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      color: AppColor.blue.withOpacity(0.5),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * h,
                      height: 25.2 / 14,
                      letterSpacing: 0.5,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                // String url = "shahvozd@hhsdc.com";
                // if (!await launchUrl(
                //   Uri(
                //     scheme: 'mailto',
                //     path: url,
                //   ),
                // )) {
                //   throw 'Could not launch $url';
                // }
              },
              child: Text(
                'Forgot Password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 12 * h,
                  height: 18 / 12,
                  letterSpacing: 0.5,
                  color: AppColor.blue,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const RegisterScreen();
                    },
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8 * h),
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have a account? ',
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 12 * h,
                        height: 18 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.grey,
                      ),
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 12 * h,
                        height: 18 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 48 * h,
            ),
          ],
        ),
      ),
    );
  }
}
