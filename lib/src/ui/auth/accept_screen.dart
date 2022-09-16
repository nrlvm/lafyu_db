import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/model/login_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:lesson_11/src/ui/main_screen/main_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/bottomsheet/bottomsheet_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcceptScreen extends StatefulWidget {
  final String email;

  const AcceptScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<AcceptScreen> createState() => _AcceptScreenState();
}

class _AcceptScreenState extends State<AcceptScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 120 * h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * w),
            child: Text(
              'Please enter verification code from your email',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 16 * h,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
          ),
          SizedBox(
            height: 16 * h,
          ),
          Center(
            child: Pinput(
              controller: _controller,
              length: 4,
              defaultPinTheme: PinTheme(
                width: 50 * w,
                height: 61 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.grey.withOpacity(0.6),
                    width: 1,
                  ),
                ),
                textStyle: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 24 * h,
                  color: AppColor.dark,
                ),
              ),
              separator: SizedBox(
                width: 31 * w,
              ),
              focusedPinTheme: PinTheme(
                width: 50 * w,
                height: 61 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.blue.withOpacity(0.8),
                    width: 1,
                  ),
                ),
                textStyle: TextStyle(
                  fontFamily: AppColor.fontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 24 * h,
                  color: AppColor.dark,
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              HttpResult response =
                  await ApiProvider().accept(widget.email, _controller.text);
              if (response.isSuccess) {
                LoginModel data = LoginModel.fromJson(response.result);
                if (data.status != 1) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return  ModalBottomSheetWidget(
                        errorMessage: data.msg,
                      );
                    },
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
              }
            },
            child: Container(
              height: 56 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.blue,
              ),
              child: Center(
                child: Text(
                  'Apply',
                  style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 16 * h,
                      height: 24 / 16,
                      letterSpacing: 0.5,
                      color: AppColor.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 56 * h,
          ),
        ],
      ),
    );
  }
}
