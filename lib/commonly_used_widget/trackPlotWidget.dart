import 'package:anomaly_detection_ui/models/AnomalHistoryIndex.dart';
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
    AnomalHistoryIndex anomalIndex = context.watch<AnomalHistoryIndex>();
    MQTTModel mqttModel = context.watch<MQTTModel>();
    double width = MediaQuery.of(context).size.width;
    double height = (MediaQuery.of(context).size.height-appWindow.titleBarHeight);
    return Container(
      width: width*0.7,
      height: height*0.7,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.fromLTRB(width*0.03, height*0.01, width*0.03, height*0.01),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
              left: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
              right: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
              bottom: BorderSide(width: 1.0, color: Color(0xFF7283FC)),
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //height: height*0.04,
              margin: EdgeInsets.all(width*0.01),
                child: Text('Sensor Data',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Color(0xFF7283FC)),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('Vibration',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Color(0xFF7283FC)),),
                      SizedBox(height: height*0.01,),
                      Container(
                        height: height*0.25,
                        width: width*0.21,
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
                                  dataSource: mqttModel.anomalDatas[anomalIndex.index]!.toList(),
                                  xValueMapper: (OhtDataModel data, _) => data.anomal_timestamp,
                                  yValueMapper: (OhtDataModel data, _) => data.accx_rms,
                                )
                              ]
                          )
                      ),
                    ],
                  ),
                  SizedBox(width: width*0.03,),
                  Column(
                    children: [
                      Text('Yaw',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Color(0xFF7283FC)),),
                      SizedBox(height: height*0.01,),
                      Container(
                          height: height*0.25,
                          width: width*0.21,
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
                                  dataSource: mqttModel.anomalDatas[anomalIndex.index]!.toList(),
                                  xValueMapper: (OhtDataModel data, _) => data.anomal_timestamp,
                                  yValueMapper: (OhtDataModel data, _) => data.yaw,
                                )
                              ]
                          )
                      ),
                    ],
                  ),

                ],
              ),
            SizedBox(height: height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text('Drive Motor Speed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Color(0xFF7283FC)),),
                    SizedBox(height: height*0.01,),
                    Container(
                        height: height*0.25,
                        width: width*0.21,
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
                                dataSource: mqttModel.anomalDatas[anomalIndex.index]!.toList(),
                                xValueMapper: (OhtDataModel data, _) => data.anomal_timestamp,
                                yValueMapper: (OhtDataModel data, _) => data.accx_rms,
                              )
                            ]
                        )
                    ),
                  ],
                ),
                SizedBox(width: width*0.03,),
                Column(
                  children: [
                    Text('Drive Motor Torque',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Color(0xFF7283FC)),),
                    SizedBox(height: height*0.01,),
                    Container(
                        height: height*0.25,
                        width: width*0.21,
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
                                dataSource: mqttModel.anomalDatas[anomalIndex.index]!.toList(),
                                xValueMapper: (OhtDataModel data, _) => data.anomal_timestamp,
                                yValueMapper: (OhtDataModel data, _) => data.yaw,
                              )
                            ]
                        )
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
