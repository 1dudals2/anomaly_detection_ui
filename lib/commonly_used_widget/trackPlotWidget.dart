import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';

class TrackPlotWidget extends StatefulWidget {
  const TrackPlotWidget({Key? key}) : super(key: key);

  @override
  _TrackPlotWidgetState createState() => _TrackPlotWidgetState();
}

class _TrackPlotWidgetState extends State<TrackPlotWidget> {

  @override
  Widget build(BuildContext context) {
    MQTTModel mqttModel = context.watch<MQTTModel>();
    double width = MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio;
    double height = (MediaQuery.of(context).size.height* MediaQuery.of(context).devicePixelRatio-appWindow.titleBarHeight)*0.5;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 100,0, 0),
        child : Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                      left: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                      right: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                      bottom: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                    )
                ),
                  child: mqttModel.anomalDatas.length == 0 ? Container() :SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        // Renders line chart
                        LineSeries<OhtDataModel, String>(
                          dataSource: mqttModel.anomalDatas[0]!.toList(),
                          xValueMapper: (OhtDataModel data, _) => data.anomal_timestamp,
                          yValueMapper: (OhtDataModel data, _) => data.accx_rms,
                        )
                      ]
                  )
              ),
              SizedBox(width: 50,),
              Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                      left: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                      right: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                      bottom: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                    )
                ),
                  child: mqttModel.anomalDatas.length == 0 ? Container() :SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        // Renders line chart
                        LineSeries<OhtDataModel, String>(
                          dataSource: mqttModel.anomalDatas[0]!.toList(),
                          xValueMapper: (OhtDataModel data, _) => data.anomal_timestamp,
                          yValueMapper: (OhtDataModel data, _) => data.yaw,
                        )
                      ]
                  )
              ),
              SizedBox(width: 50,),
              Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                      left: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                      right: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                      bottom: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
                    )
                ),
                  child: mqttModel.anomalDatas.length == 0 ? Container() :SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <ChartSeries>[
                        // Renders line chart
                        LineSeries<OhtDataModel, String>(
                          dataSource: mqttModel.anomalDatas[0]!.toList(),
                          xValueMapper: (OhtDataModel data, _) => data.anomal_timestamp,
                          yValueMapper: (OhtDataModel data, _) => data.drive_right_torque,
                        )
                      ]
                  )
              )
            ],
          )


    );
  }
}
