import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ReverseSearchScreen extends StatefulWidget {
  const ReverseSearchScreen({Key? key}) : super(key: key);

  @override
  State<ReverseSearchScreen> createState() => _ReverseSearchScreenState();
}

class _ReverseSearchScreenState extends State<ReverseSearchScreen> {
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
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    double w = Utils.width(context);
    return Scaffold(
      body: Column(
        children: [

          Stack(
            children: [
              YandexMap(
                mapObjects: mapObjects,
                onCameraPositionChanged: (CameraPosition cameraPosition,
                    CameraUpdateReason _, bool __) async {
                  lon = cameraPosition.target.longitude;
                  lat = cameraPosition.target.latitude;

                  final placemarkMapObject =
                      mapObjects.firstWhere((el) => el.mapId == cameraMapObjectId)
                          as PlacemarkMapObject;
                  setState(() {
                    mapObjects[mapObjects.indexOf(placemarkMapObject)] =
                        placemarkMapObject.copyWith(point: cameraPosition.target);
                  });
                },
                onMapCreated: (YandexMapController yandexMapController) async {
                  final placemarkMapObject =
                      mapObjects.firstWhere((el) => el.mapId == cameraMapObjectId)
                          as PlacemarkMapObject;
                  controller = yandexMapController;
                  await controller.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: placemarkMapObject.point,
                        zoom: 14,
                      ),
                    ),
                  );
                },
              ),
              Column(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // print(lat);
                      // print(lon);
                    },
                    child: Container(
                      height: 56 * h,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 20 * w),
                      color: AppColor.purple,
                      child: Center(
                        child: Text(
                          'lon: ${lon.toStringAsFixed(5)} \n lat: ${lat.toStringAsFixed(5)}',
                          style: TextStyle(
                            fontFamily: AppColor.fontFamily,
                            fontWeight: FontWeight.w500,
                            fontSize: 16 * h,
                            color: AppColor.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24 * h,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
