import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';
class GraphWidget extends StatefulWidget {
  const GraphWidget({Key? key}) : super(key: key);

  @override
  _GraphWidgetState createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  bool mqttInitialized = false;
  @override
  Widget build(BuildContext context) {
    MQTTModel mqttModel = context.watch<MQTTModel>();
    if(mqttInitialized ==false) {
      MQTTManager().InitMQTTManager(mqttModel, "01", DataCollectManager());
      mqttModel.addOht("01");
      mqttInitialized = true;
    }
    return Container(
      child: SfCartesianChart(
          primaryYAxis: NumericAxis(
            labelFormat: '{value}',
            minimum: 0,
            maximum: 0.1,
            //zoomFactor: ZoomBehavior()
          ),
          primaryXAxis: CategoryAxis(
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0),
            autoScrollingMode: AutoScrollingMode.start,
            //maximum: 0.1
          ),
          // Chart title
          title: ChartTitle(text: 'accx_rms'),
          // Enable legend
          legend: Legend(isVisible: true,),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<OhtDataModel, String>>[
            LineSeries<OhtDataModel, String>(
                dataSource: mqttModel.ohtDatas["01"]!.toList(),
                xValueMapper: (OhtDataModel anomal_timestamp, _) => mqttModel.ohtDatas["01"]!.elementAt(_).anomal_timestamp ,
                yValueMapper: (OhtDataModel accy_rms, _) => mqttModel.ohtDatas["01"]!.elementAt(_).accx_rms ,
                /* xValueMapper: (OmsDataModel sales, _) => sales.year,
                                yValueMapper: (OmsDataModel sales, _) => sales.sales,*/
                name: 'Vehicle01',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true)),
          ]),
      //color: Colors.black,
    );
  }
}
