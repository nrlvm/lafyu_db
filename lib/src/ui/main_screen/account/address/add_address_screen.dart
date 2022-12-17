import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lesson_11/src/bloc/address_bloc.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/model/address_model.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddAddressScreen extends StatefulWidget {
  final AddressModel? data;

  const AddAddressScreen({Key? key, this.data}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController city = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  late YandexMapController controller;
  double lon = 69.252462;
  double lat = 41.330126;
  late final List<MapObject> mapObjects = [
    PlacemarkMapObject(
      mapId: cameraMapObjectId,
      point: Point(latitude: lat, longitude: lon),
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage('assets/icons/place.png'),
          scale: 0.75,
        ),
      ),
      opacity: 1,
    )
  ];
  final MapObjectId cameraMapObjectId = const MapObjectId('camera_placemark');

  @override
  void initState() {
    if (widget.data != null) {
      city.text = widget.data!.city;
      phoneNumber.text = widget.data!.pNumber;
      List<String> data = widget.data!.location.split(",");
      lat = double.parse(data.first);
      lon = double.parse(data.last);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              child: SvgPicture.asset(
                'assets/icons/left.svg',
              ),
            ),
            SizedBox(
              width: 12 * h,
            ),
            Text(
              widget.data == null ? 'Add Address' : 'Edit Address',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 * w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12 * h),
            Text(
              'City',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 14 * h,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
            SizedBox(
              height: 4 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48 * h,
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.light,
                ),
              ),
              child: Center(
                child: TextField(
                  controller: city,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 12 * h,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 12 * h,
            ),
            Text(
              'Phone Number',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 14 * h,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
            SizedBox(
              height: 4 * h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 48 * h,
              padding: EdgeInsets.symmetric(horizontal: 16 * w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColor.light,
                ),
              ),
              child: Center(
                child: TextField(
                  controller: phoneNumber,
                  style: TextStyle(
                    fontFamily: AppColor.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 12 * h,
                    letterSpacing: 0.5,
                    color: AppColor.grey,
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 12 * h,
            ),
            Text(
              'Address',
              style: TextStyle(
                fontFamily: AppColor.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 14 * h,
                height: 21 / 14,
                letterSpacing: 0.5,
                color: AppColor.dark,
              ),
            ),
            SizedBox(height: 4 * h),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: YandexMap(
                  mapObjects: mapObjects,
                  onCameraPositionChanged: (CameraPosition cameraPosition,
                      CameraUpdateReason _, bool __) async {
                    lon = cameraPosition.target.longitude;
                    lat = cameraPosition.target.latitude;

                    final placemarkMapObject = mapObjects
                            .firstWhere((el) => el.mapId == cameraMapObjectId)
                        as PlacemarkMapObject;
                    setState(() {
                      mapObjects[mapObjects.indexOf(placemarkMapObject)] =
                          placemarkMapObject.copyWith(
                              point: cameraPosition.target);
                    });
                  },
                  onMapCreated:
                      (YandexMapController yandexMapController) async {
                    // final placemarkMapObject = mapObjects
                    //         .firstWhere((el) => el.mapId == cameraMapObjectId)
                    //     as PlacemarkMapObject;
                    controller = yandexMapController;
                    await controller.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: Point(latitude: lat, longitude: lon),
                          zoom: 14,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (city.text.isNotEmpty && phoneNumber.text.isNotEmpty) {
                  if (widget.data == null) {
                    addressBloc.saveAddress(
                      AddressModel(
                        city: city.text,
                        pNumber: phoneNumber.text,
                        location: "$lat,$lon",
                      ),
                    );
                  } else {
                    addressBloc.updateAddress(
                      AddressModel(
                        id: widget.data!.id,
                        city: city.text,
                        pNumber: phoneNumber.text,
                        location: "$lat,$lon",
                      ),
                    );
                  }
                  Navigator.pop(this.context);
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48 * h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.blue,
                ),
                margin: EdgeInsets.only(
                  top: 4 * h,
                  bottom: Platform.isIOS ? 24 * h : 16 * h,
                ),
                child: Center(
                  child: Text(
                    widget.data == null ? 'Add Address' : "Update Address",
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
            GestureDetector(
              onTap: () async {
                if (await Permission.location.status.isGranted) {
                  await controller.toggleUserLayer(
                    visible: true,
                    autoZoomEnabled: true,
                  );
                  print('object');
                }
                Position position = await _determinePosition();
                print(' pos $position');
                if (position != null) {
                  print(position.latitude);
                  print(position.longitude);
                  var newPos = CameraPosition(
                    zoom: 16,
                    target: Point(
                      latitude: position.latitude,
                      longitude: position.longitude,
                    ),
                  );
                  controller.moveCamera(
                    CameraUpdate.newCameraPosition(newPos),
                    animation:
                        const MapAnimation(type: MapAnimationType.linear),
                  );
                  setState(() {
                    lat = position.latitude;
                    lon = position.longitude;
                  });
                }
              },
              child: Container(
                height: 48 * h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 16 * w),
                color: AppColor.red,
              ),
            ),
            SizedBox(
              height: 24 * h,
            ),
          ],
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
