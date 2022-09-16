import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/profile_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/profile_model.dart';
import 'package:lesson_11/src/ui/main_screen/account/profile/birthday/birthday_screen.dart';
import 'package:lesson_11/src/ui/main_screen/account/profile/gender/gender_screen.dart';
import 'package:lesson_11/src/ui/main_screen/account/profile/name/change_name_screen.dart';
import 'package:lesson_11/src/ui/main_screen/account/profile/phone_number_screen/phone_number.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/account/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
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
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.white,
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
              'Profile',
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
            return ListView(
              children: [
                SizedBox(
                  height: 24 * h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16 * h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(72),
                      //   child: Image.network(
                      //     data.user.avatar,
                      //     height: 72 * h,
                      //     width: 72 * h,
                      //     fit: BoxFit.fill,
                      //   ),
                      // ),
                      SizedBox(
                        width: 16 * w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ChangeNameScreen();
                              },
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.user.firstName} ${data.user.lastName}',
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
                              height: 4 * h,
                            ),
                            Text(
                              data.user.nickname,
                              style: TextStyle(
                                fontFamily: AppColor.fontFamily,
                                fontWeight: FontWeight.w400,
                                fontSize: 12 * h,
                                height: 21.6 / 12,
                                letterSpacing: 0.5,
                                color: AppColor.grey,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 32 * h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const GenderScreen();
                        },
                      ),
                    );
                  },
                  child: ProfileWidget(
                      icon: 'gender.svg',
                      text: 'Gender',
                      result: data.user.gender),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const BirthdayScreen();
                        },
                      ),
                    );
                  },
                  child: ProfileWidget(
                      icon: 'date.svg',
                      text: 'Birthday',
                      result: data.user.birthDate),
                ),
                ProfileWidget(
                    icon: 'message.svg',
                    text: 'Email',
                    result: data.user.email),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PhoneNumberScreen();
                        },
                      ),
                    );
                  },
                  child: ProfileWidget(
                      icon: 'phone.svg',
                      text: 'Phone Number',
                      result: data.user.number),
                ),
                const ProfileWidget(
                    icon: 'password.svg',
                    text: 'Change Password',
                    result: 'asd'),
              ],
            );
          }
          return const Text(
            'error',
          );
        },
      ),
    );
  }
}
