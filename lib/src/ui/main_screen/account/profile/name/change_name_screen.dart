import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/profile_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/profile_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';

class ChangeNameScreen extends StatefulWidget {
  const ChangeNameScreen({Key? key}) : super(key: key);

  @override
  State<ChangeNameScreen> createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    profileBlock.allFlName('','');
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
              'Name',
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
        stream: profileBlock.getFlName,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProfileModel data = snapshot.data!;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16 * h,
                  ),
                  Text(
                    'First Name',
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
                    height: 48 * h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 16 * w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColor.light,
                        width: 1,
                      ),
                    ),
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
                          hintText: 'First Name',
                          hintStyle: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 12 * h,
                            height: 21.6 / 12,
                            letterSpacing: 0.5,
                            color: AppColor.grey,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 24 * h,
                  ),
                  Text(
                    'Last Name',
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
                    height: 48 * h,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 16 * w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: AppColor.light,
                        width: 1,
                      ),
                    ),
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
                          hintText: 'Last Name',
                          hintStyle: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 12 * h,
                            height: 21.6 / 12,
                            letterSpacing: 0.5,
                            color: AppColor.grey,
                          )),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      data.user.firstName = _controller1.text;
                      data.user.lastName = _controller2.text;
                      ApiProvider()
                          .setName(_controller1.text, _controller2.text);
                      Navigator.pop(context);
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
                            color: AppColor.blue.withOpacity(0.24),
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Save',
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
                    height: 50 * h,
                  ),
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
