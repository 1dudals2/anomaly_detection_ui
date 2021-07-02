import 'dart:convert';

import 'package:anomaly_detection_ui/managers/drawingManager.dart';
import 'package:anomaly_detection_ui/models/MapData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

double containerWidth = 400;
double containerHeight = 400;
double scaleFactorForWidget = 0.009;
class MapPaintingWidget extends StatefulWidget {
  const MapPaintingWidget({Key? key}) : super(key: key);

  @override
  _MapPaintingWidgetState createState() => _MapPaintingWidgetState();
}

class _MapPaintingWidgetState extends State<MapPaintingWidget> {
  MapData map = new MapData([],[]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadJsonData();
  }
  _loadJsonData() async {
    var jsonText = await rootBundle.loadString('lib/semioht-v3.0.0.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonText);
    var map = MapData.fromJson(jsonMap);
    print(map.segments.length);
    setState(() {
      this.map = map;
    });
  }
  @override
  Widget build(BuildContext context) {
    containerWidth = 350;
    containerHeight =430;
    return Container(
      width: containerWidth + 16,
      height: containerHeight +20,
      color: Color(0xFF7283FC),
      child: FittedBox(
        child: Container(
            color: Colors.white,
            width: containerWidth,
            height: containerHeight,
            child: InteractiveViewer(
              maxScale: 100000,
              minScale: 0.01,
              panEnabled: true,
              child: Transform.scale(
                scale: scaleFactorForWidget,
                child: CustomPaint(

                  painter: new OpenPainter(this.map),
                ),
              ),
            )),
      ),
    );
  }
}
class OpenPainter extends CustomPainter{
  OpenPainter(this.map);
  MapData map;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    canvas.translate(-containerWidth * (1/scaleFactorForWidget) * (1/2), containerHeight * (1/scaleFactorForWidget) * (1/2));
    paint.color = Color(0xFF7283FC);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 100;
    DrawingManager drawingManager = new DrawingManager(canvas);
    drawingManager.drawFromMapData(this.map);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
