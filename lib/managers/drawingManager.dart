import 'dart:ui';
import 'dart:math' as Math;

import 'package:anomaly_detection_ui/models/MapData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawingManager{
  Canvas canvas;

  DrawingManager(
      this.canvas,
      );
  double degToRad(num deg) => deg * (Math.pi / 180.0);



  Path getQ1Path(Offset startPoint, double circleSize){

    Path path = new Path();
    path.addArc(Rect.fromLTWH(
        startPoint.dx - circleSize,
        startPoint.dy - circleSize /2,
        circleSize,
        circleSize
    ),degToRad(0),degToRad(90));
    return path;
  }

  Path getQ2Path(Offset startPoint, double circleSize){
    Path path = new Path();
    path.addArc(Rect.fromLTWH(startPoint.dx , startPoint.dy - circleSize / 2, circleSize, circleSize),degToRad(180),degToRad(-90));
    return path;
  }

  Path getQ3Path(Offset startPoint, double circleSize){
    Path path = new Path();
    path.addArc(Rect.fromLTWH(startPoint.dx - circleSize / 2, startPoint.dy , circleSize, circleSize),degToRad(180),degToRad(90));
    return path;
  }

  Path getQ4Path(Offset startPoint, double circleSize){
    Path path = new Path();
    path.addArc(Rect.fromLTWH(startPoint.dx -circleSize / 2 , startPoint.dy , circleSize, circleSize), degToRad(270), degToRad(90));
    return path;
  }

  void drawStraightLine(Offset startPoint, Offset endPoint, Paint paint){
    canvas.drawLine(startPoint,endPoint, paint);
  }

  void drawCurveQ4(Offset startPoint, Offset endPoint, Paint paint){
    var controlPoint1 = Offset(startPoint.dx, endPoint.dy );

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint1.dx, controlPoint1.dy,
        endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  void drawCurveQ3(Offset startPoint, Offset endPoint, Paint paint){
    var controlPoint1 = Offset(endPoint.dx, startPoint.dy );

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint1.dx, controlPoint1.dy,
        endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  void drawCurveQ2(Offset startPoint, Offset endPoint, Paint paint){
    var controlPoint1 = Offset(startPoint.dx, endPoint.dy );

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint1.dx, controlPoint1.dy,
        endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  void drawCurveQ1(Offset startPoint, Offset endPoint, Paint paint){
    var controlPoint1 = Offset( endPoint.dx,startPoint.dy );

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy,
        controlPoint1.dx, controlPoint1.dy,
        endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  void draw180CurveRight(Offset startPoint, Offset endPoint, Paint paint, double length){
    double circleSize = 500;
    drawStraightLine(
        startPoint,
        Offset(startPoint.dx + length, startPoint.dy),
        paint
    );
    canvas.drawPath(getQ4Path(Offset(startPoint.dx + length, startPoint.dy),circleSize), paint);
    drawStraightLine(Offset(startPoint.dx + length + circleSize / 2,startPoint.dy + circleSize / 2),
         Offset(endPoint.dx + length + circleSize / 2, endPoint.dy - circleSize / 2),
         paint
     );
    canvas.drawPath(getQ1Path( Offset(endPoint.dx + length + circleSize / 2, endPoint.dy - circleSize / 2),circleSize), paint);
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
    double circleSize = 500;
    drawStraightLine(
        startPoint,
        Offset(startPoint.dx , startPoint.dy - length),
        paint
    );
    canvas.drawPath(getQ4Path(Offset(startPoint.dx -circleSize/2  , startPoint.dy - length - circleSize / 2) , circleSize), paint);
    drawStraightLine(Offset(startPoint.dx - circleSize/2  ,startPoint.dy- length - circleSize / 2),
        Offset(endPoint.dx + circleSize /2, endPoint.dy - length - circleSize / 2),
        paint
    );
    canvas.drawPath(getQ3Path( Offset(endPoint.dx  + circleSize /2, endPoint.dy - length - circleSize / 2),circleSize), paint);
    drawStraightLine( endPoint,Offset(endPoint.dx , endPoint.dy- length), paint);
  }

  void draw180CurveDown(Offset startPoint, Offset endPoint, Paint paint, double length){
    double circleSize = 500;
    drawStraightLine(
        startPoint,
        Offset(startPoint.dx , startPoint.dy + length),
        paint
    );
    canvas.drawPath(getQ2Path(Offset(startPoint.dx  , startPoint.dy + length ), circleSize), paint);
    drawStraightLine(Offset(startPoint.dx + circleSize / 2 ,startPoint.dy + length + circleSize / 2),
        Offset(endPoint.dx - circleSize / 2, endPoint.dy + length + circleSize / 2),
        paint
    );
    canvas.drawPath(getQ1Path( Offset(endPoint.dx  , endPoint.dy + length ),circleSize), paint);
    drawStraightLine( endPoint,Offset(endPoint.dx , endPoint.dy+ length), paint);
  }
  void drawSCurve(Offset startPoint, Offset endPoint, Paint paint){
    Offset midPoint = Offset(
      Math.min(startPoint.dx, endPoint.dx)+ ((startPoint.dx - endPoint.dx).abs()/2),
      Math.min(startPoint.dy, endPoint.dy) + ((startPoint.dy - endPoint.dy).abs()/2)
    );
    drawCurveQ3(
        startPoint,
        midPoint,
        paint);
    drawCurveQ4(
        midPoint,
        endPoint,
        paint);
  }
  void drawSCurveCounter(Offset startPoint, Offset endPoint, Paint paint){
    Offset midPoint = Offset(
        Math.min(endPoint.dx, startPoint.dx)+ ((endPoint.dx - startPoint.dx).abs()/2),
        Math.min(endPoint.dy, startPoint.dy) + ((endPoint.dy - startPoint.dy).abs()/2)
    );
    drawCurveQ3(
        endPoint,
        midPoint,
        paint);
    drawCurveQ4(
        midPoint,
        startPoint,
        paint);
  }
  void drawFromMapData(MapData map){
    Paint paint = new Paint();

    paint.color = Colors.lightBlue;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 100;
    double length = 100;
    map.segments.forEach((segment)
    {
      var start_point = MapData.findPointById(segment.start_point, map);
      var end_point = MapData.findPointById(segment.end_point, map);
      var startPoint = Offset(start_point.x + 10000,-start_point.y);
      var endPoint = Offset(end_point.x + 10000, -end_point.y);
      if(segment.id == 17) paint.color = Colors.redAccent;
      else paint.color =Color(0xFF7283FC);
      var segparts = segment.seg_parts;
      if(segparts.length == 1){
        drawStraightLine(startPoint, endPoint, paint);
      }
      else if (segparts.length ==3){
        if(segparts[1].location == "Q1"){
          drawCurveQ1(startPoint, endPoint, paint);
        }
        else if(segparts[1].location == "Q2"){
          drawCurveQ2(startPoint, endPoint, paint);
        }
        else if(segparts[1].location == "Q3"){
          drawCurveQ3(startPoint, endPoint, paint);
        }
        else if(segparts[1].location == "Q4"){
          drawCurveQ4(startPoint, endPoint, paint);
        }
      }
      else if(segparts.length == 5){
        //Scurve
        if(segparts[1].direction =="COUNTER_CLOCK"){
          drawSCurveCounter(startPoint, endPoint, paint);
        }
        else if(segparts[3].direction == "COUNTER_CLOCK"){
            drawSCurve(startPoint, endPoint, paint);
        }
        //180 Curve
        else if(segparts[1].location == "Q1"){
          draw180CurveRight(startPoint, endPoint, paint, length);
        }
        else if(segparts[1].location == "Q2"){
          draw180CurveDown(startPoint, endPoint, paint, length);
        }
        else if(segparts[1].location == "Q3"){
          draw180CurveLeft(startPoint, endPoint, paint, length);
        }
        else if(segparts[1].location == "Q4"){
          draw180CurveUp(startPoint, endPoint, paint, length);
        }
      }

    });
  }
}

