import 'package:flutter/material.dart';
import 'package:lesson_11/src/bloc/offer_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/super_flash_model.dart';
import 'package:lesson_11/src/ui/main_screen/home/offer_screen.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:lesson_11/src/widget/shimmer/product/screen_shimmer.dart';
import 'package:lesson_11/src/widget/super_flash_sale/super_flash_widget.dart';

class OfferScreenMain extends StatefulWidget {
  const OfferScreenMain({Key? key}) : super(key: key);

  @override
  State<OfferScreenMain> createState() => _OfferScreenMainState();
}

class _OfferScreenMainState extends State<OfferScreenMain> {
  @override
  void initState() {
    offerBloc.allOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Offers',
          style: TextStyle(
            fontFamily: AppColor.fontFamily,
            fontWeight: FontWeight.w500,
            fontSize: 20 * h,
            color: AppColor.dark,
          ),
        ),
      ),
      body: StreamBuilder<SuperFlashModel>(
        stream: offerBloc.getOffers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SuperFlashModelResult> data = snapshot.data!.results;
            return ListView.builder(
              padding: EdgeInsets.only(top: 16 * h),
              itemCount: data.length,
              itemBuilder: (context, index) => Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OfferScreen(
                            id: data[index].id,
                            data: data[index].product, superFlashModelResult: data[index],
                          ),
                        ),
                      );
                    },
                    child: SuperFlashWidget(
                      data: data[index],
                    ),
                  ),
                  SizedBox(
                    height: 16 * h,
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
