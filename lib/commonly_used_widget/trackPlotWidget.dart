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
    return Expanded(
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
