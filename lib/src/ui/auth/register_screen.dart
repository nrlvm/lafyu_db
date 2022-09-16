import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/dialog/center_dialog.dart';
import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/model/login_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:lesson_11/src/ui/auth/accept_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/bottomsheet/bottomsheet_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 * w),
        child: ListView(
          children: [
            SizedBox(
              height: 84 * h,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
              ),
            ),
            SizedBox(
              height: 16 * h,
            ),
            SizedBox(
              height: 16 * h,
            ),
            Text(
              'Let\'s Get Started',
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
              'Create a new account',
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
              height: 48 * h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.grey,
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/user.svg',
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
                        fontWeight: FontWeight.w400,
                        fontSize: 12 * h,
                        height: 21.6 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.grey,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: 'Full Name',
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Container(
              height: 48 * h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.grey,
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
                      controller: _controller2,
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 12 * h,
                        height: 21.6 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.grey,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Container(
              height: 48 * h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.grey,
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
                      controller: _controller3,
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 12 * h,
                        height: 21.6 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.grey,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8 * h,
            ),
            Container(
              height: 48 * h,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.grey,
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
                      controller: _controller4,
                      style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 12 * h,
                        height: 21.6 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.grey,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: 'Password Again',
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
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16 * h,
            ),
            GestureDetector(
              onTap: () async {
                if (_controller1.text.isEmpty && _controller2.text.isEmpty) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const ModalBottomSheetWidget(
                            errorMessage:
                                'Please Enter Your Full Name and Email');
                      });
                } else if (_controller4.text != _controller3.text) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const ModalBottomSheetWidget(
                          errorMessage: 'Passwords are not the same');
                    },
                  );
                } else if (_controller3.text.length < 6) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const ModalBottomSheetWidget(
                          errorMessage: 'Password is too weak');
                    },
                  );
                } else {
                  HttpResult response = await ApiProvider().register(
                    _controller2.text,
                    _controller1.text,
                    _controller3.text,
                    _controller4.text,
                  );
                  if (response.isSuccess) {
                    LoginModel data = LoginModel.fromJson(response.result);
                    if (data.status != 1) {
                      CenterDialog.showErrorDialog(
                        this.context,
                        data.msg,
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AcceptScreen(
                              email: _controller2.text,
                            );
                          },
                        ),
                      );
                    }
                  } else {
                    CenterDialog.showErrorDialog(
                      this.context,
                      "Xatolik yuz berdi",
                    );
                  }
                }
              },
              child: Container(
                height: 56 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.blue,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                      color: AppColor.blue.withOpacity(0.4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 14 * h,
                        height: 25.2 / 14,
                        color: AppColor.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24 * h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'have an account? ',
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
                  'Sign in',
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
            )
          ],
        ),
      ),
    );
  }
}
