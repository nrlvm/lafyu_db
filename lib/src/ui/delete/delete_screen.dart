import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lesson_11/src/colors/app_color.dart';
import 'package:lesson_11/src/utils/utils.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({Key? key}) : super(key: key);

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final List<MapObject> mapObjects = [];
  final MapObjectId mapObjectWithDynamicIconId =
      const MapObjectId('dynamic_icon_placemark');

  Future<Uint8List> _rawPlacemarkImage() async {
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder);
    const size = Size(50, 50);
    final fillPaint = Paint()
      ..color = Colors.blue[100]!
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    const radius = 20.0;

    final circleOffset = Offset(size.height / 2, size.width / 2);

    canvas.drawCircle(circleOffset, radius, fillPaint);
    canvas.drawCircle(circleOffset, radius, strokePaint);

    final image = await recorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);

    return pngBytes!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.height(context);
    return Column(
      children: [
        Expanded(
          child: YandexMap(
            mapObjects: mapObjects,
          ),
        ),
        SizedBox(
          height: 12 * h,
        ),
        GestureDetector(
          onTap: () async {
            if (mapObjects
                .any((el) => el.mapId == mapObjectWithDynamicIconId)) {
              return;
            }

            final mapObjectWithDynamicIcon = PlacemarkMapObject(
                mapId: mapObjectWithDynamicIconId,
                point: const Point(
                  latitude: 41.330126,
                  longitude: 69.252462,
                ),
                // onTap: (PlacemarkMapObject self, Point point) =>
                //     print('Tapped me at $point'),
                isDraggable: true,
                // onDragStart: (_) => print('Drag start'),
                // onDrag: (_, Point point) => print('Drag at point $point'),
                // onDragEnd: (_) => print('Drag end'),
                opacity: 0.95,
                icon: PlacemarkIcon.single(PlacemarkIconStyle(
                    image: BitmapDescriptor.fromBytes(
                        await _rawPlacemarkImage()))));

            setState(() {
              mapObjects.add(mapObjectWithDynamicIcon);
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 56 * h,
            color: AppColor.purple,
            child: const Center(
              child: Text(
                'save',
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24 * h,
        ),
        GestureDetector(
          onTap: ()async{
            setState(() {
              mapObjects.removeWhere((el) => el.mapId == mapObjectWithDynamicIconId);
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 56 * h,
            color: AppColor.red,
            child: const Center(
              child: Text(
                'remove',
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24 * h,
        )
      ],
    );
  }
}
