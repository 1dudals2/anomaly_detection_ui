import 'package:anomaly_detection_ui/commonly_used_widget/MapPaintingWidget.dart';
import 'package:anomaly_detection_ui/commonly_used_widget/anomalDataHistoryTable.dart';
import 'package:anomaly_detection_ui/commonly_used_widget/trackPlotWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({Key? key}) : super(key: key);

  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
     // mainAxis: Axis.horizontal,
      children: [
        MapPaintingWidget(),
        AnomalHistoryTable(),
      ],
    );
  }
}
