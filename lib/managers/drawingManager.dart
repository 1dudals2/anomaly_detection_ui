import 'dart:ui';
import 'dart:math' as Math;

class DrawingManager{
  Canvas canvas;

  DrawingManager(
      this.canvas,
      );
  double degToRad(num deg) => deg * (Math.pi / 180.0);



  Path getQ1Path(Offset startPoint){
    Path path = new Path();
    path.addArc(Rect.fromLTWH(
        startPoint.dx - 100,
        startPoint.dy - 50,
        100,
        100
    ),degToRad(0),degToRad(90));
    return path;
  }

  Path getQ2Path(Offset startPoint, double circleSize){
    Path path = new Path();
    path.addArc(Rect.fromLTWH(startPoint.dx , startPoint.dy - 50, circleSize, circleSize),degToRad(180),degToRad(-90));
    return path;
  }

  Path getQ3Path(Offset startPoint, double circleSize){
    Path path = new Path();
    path.addArc(Rect.fromLTWH(startPoint.dx - circleSize / 2, startPoint.dy, circleSize, circleSize),degToRad(180),degToRad(90));
    return path;
  }

  Path getQ4Path(Offset startPoint){
    Path path = new Path();
    path.addArc(Rect.fromLTWH(startPoint.dx -50 , startPoint.dy , 100, 100), degToRad(270), degToRad(90));
    return path;
  }

  void drawStraightLine(Offset startPoint, Offset endPoint, Paint paint){
    canvas.drawLine(startPoint,endPoint, paint);
  }

  void drawCurveClock(Offset startPoint, Offset endPoint, Paint paint){
    var controlPoint1 = Offset(startPoint.dx, endPoint.dy );

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint1.dx, controlPoint1.dy,
        endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  void drawCurveCounter(Offset startPoint, Offset endPoint, Paint paint){
    var controlPoint1 = Offset(endPoint.dx, startPoint.dy );

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint1.dx, controlPoint1.dy,
        endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  void draw180CurveRight(Offset startPoint, Offset endPoint, Paint paint, double length){
    drawStraightLine(
        startPoint,
        Offset(startPoint.dx + length, startPoint.dy),
        paint
    );
    canvas.drawPath(getQ4Path(Offset(startPoint.dx + length, startPoint.dy)), paint);
    drawStraightLine(Offset(startPoint.dx + length + 50,startPoint.dy + 50),
         Offset(endPoint.dx + length + 50, endPoint.dy - 50),
         paint
     );
    canvas.drawPath(getQ1Path( Offset(endPoint.dx + length + 50, endPoint.dy - 50)), paint);
    drawStraightLine( endPoint,Offset(endPoint.dx + length, endPoint.dy), paint);
  }

  void draw180CurveLeft(Offset startPoint, Offset endPoint, Paint paint, double length){
    double circleSize = 500;
    drawStraightLine(
        startPoint,
        Offset(startPoint.dx - length, startPoint.dy),
        paint
    );
    canvas.drawPath(getQ3Path(Offset(startPoint.dx - length, startPoint.dy) , circleSize), paint);
    drawStraightLine(Offset(startPoint.dx - length - circleSize / 2,startPoint.dy + circleSize / 2),
        Offset(endPoint.dx - length - circleSize / 2, endPoint.dy - circleSize / 2),
        paint
    );
    canvas.drawPath(getQ2Path( Offset(endPoint.dx - length - circleSize / 2,endPoint.dy - circleSize / 2),circleSize), paint);
    drawStraightLine( endPoint,Offset(endPoint.dx - length, endPoint.dy), paint);
  }

  void draw180CurveUp(Offset startPoint, Offset endPoint, Paint paint, double length){
    drawStraightLine(
        startPoint,
        Offset(startPoint.dx , startPoint.dy - length),
        paint
    );
    canvas.drawPath(getQ3Path(Offset(startPoint.dx + 50 , startPoint.dy - length - 50) , 100), paint);
    drawStraightLine(Offset(startPoint.dx + 50 ,startPoint.dy- length - 50),
        Offset(endPoint.dx - 50, endPoint.dy - length - 50),
        paint
    );
    canvas.drawPath(getQ4Path( Offset(endPoint.dx - 50, endPoint.dy - length - 50)), paint);
    drawStraightLine( endPoint,Offset(endPoint.dx , endPoint.dy- length), paint);
  }

  void draw180CurveDown(Offset startPoint, Offset endPoint, Paint paint, double length){
    drawStraightLine(
        startPoint,
        Offset(startPoint.dx , startPoint.dy + length),
        paint
    );
    canvas.drawPath(getQ2Path(Offset(startPoint.dx  , startPoint.dy + length ), 100), paint);
    drawStraightLine(Offset(startPoint.dx + 50 ,startPoint.dy + length + 50),
        Offset(endPoint.dx - 50, endPoint.dy + length + 50),
        paint
    );
    canvas.drawPath(getQ1Path( Offset(endPoint.dx  , endPoint.dy + length )), paint);
    drawStraightLine( endPoint,Offset(endPoint.dx , endPoint.dy+ length), paint);
  }

}