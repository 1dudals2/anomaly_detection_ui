import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackPlotWidget extends StatefulWidget {
  const TrackPlotWidget({Key? key}) : super(key: key);

  @override
  _TrackPlotWidgetState createState() => _TrackPlotWidgetState();
}

class _TrackPlotWidgetState extends State<TrackPlotWidget> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio;
    double height = (MediaQuery.of(context).size.height* MediaQuery.of(context).devicePixelRatio-appWindow.titleBarHeight)*0.5;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30,0, 0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 200,
                width: 400,
                color: Colors.amberAccent,
              ),
              SizedBox(width: 50,),
              Container(
                height: 200,
                width: 400,
                color: Colors.amberAccent,
              )
            ],
          ),
          SizedBox(height: 50,),
          Row(
            children: [
              Container(
                height: 200,
                width: 400,
                color: Colors.amberAccent,
              ),
              SizedBox(width: 50,),
              Container(
                height: 200,
                width: 400,
                color: Colors.amberAccent,
              )
            ],
          )
        ],
      ),
    );
  }
}
