import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lesson_11/src/bloc/review_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/product/product_review/choose_star_widget.dart';

class AddReviewScreen extends StatefulWidget {
  final int productId;

  const AddReviewScreen({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  int starCount = 4;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 1,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.transparent,
            child: SvgPicture.asset(
              'assets/icons/left.svg',
              fit: BoxFit.none,
            ),
          ),
        ),
        title: Text(
          'Write Review',
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 20 * h,
            color: AppColor.dark,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16 * w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16 * h,
              ),
              Text(
                'Please write Overall level of satisfaction '
                'with your shipping / Delivery Service',
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
                height: 16 * h,
              ),
              Row(
                children: [
                  ChooseStarWidget(
                    onTap1: () {
                      starCount = 1;
                      setState(() {});
                    },
                    onTap2: () {
                      starCount = 2;
                      setState(() {});
                    },
                    onTap3: () {
                      starCount = 3;
                      setState(() {});
                    },
                    onTap4: () {
                      starCount = 4;
                      setState(() {});
                    },
                    onTap5: () {
                      starCount = 5;
                      setState(() {});
                    },
                    star: starCount,
                  ),
                  Text(
                    '$starCount/5',
                    style: TextStyle(
                      fontFamily: AppColor.fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 14 * h,
                      height: 21 / 14,
                      letterSpacing: 0.5,
                      color: AppColor.grey,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24 * h,
              ),
              Text(
                'Write Your Review',
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
                height: 160 * h,
                padding:
                    EdgeInsets.symmetric(horizontal: 16 * w, vertical: 16 * h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColor.light,
                  ),
                ),
                child: TextField(
                  controller: controller,
                  expands: true,
                  maxLines: null,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write your review here',
                      hintStyle: TextStyle(
                        fontFamily: AppColor.fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 12 * h,
                        height: 21.6 / 12,
                        letterSpacing: 0.5,
                        color: AppColor.grey,
                      )),
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 12 * h,
                    height: 21.6 / 12,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 24 * h,
              ),
              Text(
                'Add Photo',
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
              image == null
                  ? GestureDetector(
                      onTap: () {
                        pickImage();
                        setState(() {});
                      },
                      child: Container(
                        height: 72 * h,
                        width: 72 * h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: AppColor.light,
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/plus.svg',
                            height: 24 * h,
                            width: 24 * h,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        image = null;
                        pickImage();
                        setState(() {});
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          image!,
                          height: 72 * h,
                          width: 72 * h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  await reviewBloc.saveReview(
                    widget.productId,
                    starCount,
                    controller.text.trim(),
                  );
                  Navigator.pop(this.context);
                },
                child: Container(
                  height: 56 * h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    left: 16 * w,
                    right: 16 * w,
                    bottom: Platform.isIOS ? 24 * h : 16 * h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                        color: AppColor.blue.withOpacity(0.24),
                      ),
                    ],
                    color: AppColor.blue,
                  ),
                  child: Center(
                    child: Text(
                      'Post Review',
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
            ],
          ),
        ),
      ),
    );
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick img $e');
    }
  }
}
