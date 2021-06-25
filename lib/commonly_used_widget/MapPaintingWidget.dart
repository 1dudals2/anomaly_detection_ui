import 'package:anomaly_detection_ui/managers/drawingManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double containerWidth = 400;
double containerHeight = 400;
double scaleFactorForWidget = 0.001;

class MapPaintingWidget extends StatefulWidget {
  const MapPaintingWidget({Key? key}) : super(key: key);

  @override
  _MapPaintingWidgetState createState() => _MapPaintingWidgetState();
}

class _MapPaintingWidgetState extends State<MapPaintingWidget> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 405,
        height: 405,
        color: Colors.black,
        child: FittedBox(
          child: Container(
              color: Colors.white,
              width: containerWidth ,
              height: containerHeight,
              child: InteractiveViewer(
                maxScale: 10000,
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
    paint.strokeWidth = 500;
    DrawingManager drawingManager = new DrawingManager(canvas);
    drawingManager.draw180CurveLeft(
        Offset(6775, -40930),
        Offset(6775,-39010),
        paint,
        3000,
    );

/*    var startPoint = Offset(100,100);
    var endPoint = Offset(300,100);
    var controlPoint1 = Offset(endPoint.dx, startPoint.dy );
    var controlPoint2 = Offset(endPoint.dx, startPoint.dy );

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint2.dx, controlPoint2.dy,
        endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);


    var startPoint1 = Offset(300,100);
    var endPoint1 = Offset(400,150);
    var controlPoint1_1 = Offset(endPoint1.dx, startPoint1.dy );
    var controlPoint1_2 = Offset(endPoint1.dx, startPoint1.dy );

    var path1 = Path();
    path1.moveTo(startPoint1.dx, startPoint1.dy);
    path1.cubicTo(controlPoint1_1.dx, controlPoint1_1.dy,
        controlPoint1_2.dx, controlPoint1_2.dy,
        endPoint1.dx, endPoint1.dy);*/


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
