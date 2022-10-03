import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/profile_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/profile_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:lesson_11/src/utils/date.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  late String bday;
  var newDate = DateTime.now();

  @override
  void initState() {
    profileBlock.allBirthday('00-00-2000');
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
        automaticallyImplyLeading: false,
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
              'Birthday',
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
        stream: profileBlock.getBirthday,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ProfileModel data = snapshot.data!;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16 * w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16 * h,
                  ),
                  Text(
                    'Your Birthday',
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
                  CalendarDatePicker(
                    initialDate: newDate,
                    firstDate: DateTime(1960, 1, 1),
                    lastDate: DateTime.now(),
                    onDateChanged: (newDate) {
                      // bday =
                      //     '${newDate.day.toString()} ${newDate.month.toString()} ${newDate.year.toString()}';
                      // bday =
                      //     "${dateUtil(newDate.day)} ${dateUtil(newDate.month)} ${dateUtil(newDate.year)}";
                      bday = DateUtil.setDate(newDate);
                      setState(() {});
                    },
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      data.user.birthDate = bday;
                      ApiProvider().setBirthday(data.user.birthDate);
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
                            offset: Offset(0, 10 * h),
                            blurRadius: 30,
                            color: AppColor.blue.withOpacity(0.24),
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
          }
          return const ScreenShimmer();
        },
      ),
    );
  }
}
