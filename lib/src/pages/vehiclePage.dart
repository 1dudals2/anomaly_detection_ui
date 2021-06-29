import 'package:anomaly_detection_ui/commonly_used_widget/VehicleList.dart';
import 'package:anomaly_detection_ui/src/pages/vehicleChartPage.dart';
import 'package:anomaly_detection_ui/src/pages/vehicleGraphPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
class VehiclePage extends StatefulWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  bool mqttInitialized = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio;
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VehicleList(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    VehicleChartPage(),
                    VehicleGraphPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
