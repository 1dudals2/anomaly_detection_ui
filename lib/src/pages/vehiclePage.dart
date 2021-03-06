import 'package:anomaly_detection_ui/commonly_used_widget/VehicleList.dart';
import 'package:anomaly_detection_ui/commonly_used_widget/trackPlotWidget.dart';
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
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VehicleList(),
          Container(
            width: width*0.83,
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VehicleChartPage(),
                //VehicleGraphPage(),
                TrackPlotWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
