import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson_11/src/bloc/profile_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/profile_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/shimmer/gender/gender_shimmer.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String dropdownvalue = 'choose gender';
  var items = [
    'Male',
    'Female',
    'Other',
  ];

  @override
  void initState() {
    profileBlock.allGender('select gender');
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
              'Gender',
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
      body: StreamBuilder<ProfileModel>(
          stream: profileBlock.getGender,
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
                      'Choose Gender',
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
                      alignment: Alignment.centerLeft,
                      height: 56 * h,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16 * w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColor.light,
                          width: 1,
                        ),
                      ),
                      child: DropdownButton(
                        hint: Text(
                          dropdownvalue,
                          style: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w400,
                            fontSize: 12 * h,
                            height: 21.6 / 12,
                            letterSpacing: 0.5,
                            color: AppColor.grey,
                          ),
                        ),
                        isExpanded: true,
                        autofocus: true,
                        underline: const SizedBox(),
                        focusColor: AppColor.blue,
                        items: items.map(
                          (String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                  fontFamily: AppColor.fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12 * h,
                                  height: 21.6 / 12,
                                  letterSpacing: 0.5,
                                  color: AppColor.grey,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        data.user.gender = dropdownvalue;
                        await ApiProvider().setGender(data.user.gender);
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
            }
            return Column(
              children: [
                SizedBox(
                  height: 16 * h,
                ),
                const GenderShimmer(),
              ],
            );
          }),
    );
  }
}
