import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Container(
            color: Colors.white,
            width: 400 ,
            height: 400,
            child: CustomPaint(
              painter: OpenPainter(),
            )),
      ),
    );
  }
}
class OpenPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Colors.lightBlue;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    var startPoint = Offset(0, size.height / 2);
    var endPoint = Offset(size.width, size.height / 2);
    var controlPoint1 = Offset(size.width/2, size.height );
    var controlPoint2 = Offset(size.width/2, size.height );

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint2.dx, controlPoint2.dy,
        endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
