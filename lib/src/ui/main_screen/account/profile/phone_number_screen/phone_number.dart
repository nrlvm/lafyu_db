import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/profile_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/profile_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // profileBlock.allPhoneNumber('ProfileModel().user.number)');
    profileBlock.allProfile();
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
              child: SvgPicture.asset('assets/icons/left.svg'),
            ),
            SizedBox(
              width: 12 * w,
            ),
            Text(
              'Phone Number',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 16 * h,
                height: 24 / 16,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<ProfileModel>(
        stream: profileBlock.getProfile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProfileModel data = snapshot.data!;
            _controller.text = data.user.number;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16 * h,
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
                    height: 48 * h,
                    padding: EdgeInsets.symmetric(horizontal: 16 * w),
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
                          'assets/icons/phone.svg',
                          color: AppColor.grey,
                        ),
                        SizedBox(
                          width: 10 * w,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _controller,
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
                              hintText: data.user.number,
                              hintStyle: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w700,
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
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      data.user.number = _controller.text;
                      await ApiProvider().setPhoneNumber(_controller.text);
                      Navigator.pop(this.context);
                    },
                    child: Container(
                      height: 56 * h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.blue,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 10),
                            blurRadius: 30,
                            color: AppColor.blue.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Save',
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
                  SizedBox(
                    height: 50 * h,
                  )
                ],
              ),
            );
          } else {
            return const ScreenShimmer();
          }
        },
      ),
    );
  }
}
