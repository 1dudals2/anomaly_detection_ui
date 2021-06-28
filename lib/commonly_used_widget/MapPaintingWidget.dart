import 'package:anomaly_detection_ui/managers/drawingManager.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double containerWidth = 400;
double containerHeight = 400;
double scaleFactorForWidget = 0.003;

class MapPaintingWidget extends StatefulWidget {
  const MapPaintingWidget({Key? key}) : super(key: key);

  @override
  _MapPaintingWidgetState createState() => _MapPaintingWidgetState();
}

class _MapPaintingWidgetState extends State<MapPaintingWidget> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio;
    double height = MediaQuery.of(context).size.height* MediaQuery.of(context).devicePixelRatio-appWindow.titleBarHeight;
    containerWidth = width;
    containerHeight = height * 0.5;
    return Center(

      child: FittedBox(
        child: Container(
            color: Colors.amber,
            width: containerWidth,
            height: containerHeight,
            child: InteractiveViewer(
              maxScale: 100000,
              minScale: 0.2,
              panEnabled: true,
              child: Transform.scale(
                scale: scaleFactorForWidget,
                child: CustomPaint(
                  painter: OpenPainter(),
                ),
              ),
            )),
      ),
    );
  }
}
class OpenPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    canvas.translate(-containerWidth * (1/scaleFactorForWidget) * (1/2), containerHeight * (1/scaleFactorForWidget) * (1/2));
    paint.color = Colors.lightBlue;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 100;
    DrawingManager drawingManager = new DrawingManager(canvas);
    drawingManager.draw180CurveLeft(
        Offset(6775, -40930),
        Offset(6775,-39010),
        paint,
        500,
    );
    drawingManager.drawCurveClock(
      Offset(2500, -44714),
      Offset(3547,-46500),
      paint,
    );
    drawingManager.drawCurveCounter(
        Offset(3547, -46500),
        Offset(4800, -44935),
        paint
    );
    drawingManager.drawSCurve(
        Offset(9557, -41930),
        Offset(6775 , -40930),
        paint)
    ;
    drawingManager.drawSCurve(
    Offset(12434, -41930), Offset(14985, -40930), paint);
    drawingManager.drawCurveClock(
      Offset(4800, -37407),
      Offset(7122, -39010),
      paint
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
