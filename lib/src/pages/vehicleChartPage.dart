import 'dart:math';

import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/AnomalHistoryIndex.dart';
import 'package:anomaly_detection_ui/models/histogramTick.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:csv/csv.dart';

class VehicleChartPage extends StatefulWidget {
  const VehicleChartPage({Key? key}) : super(key: key);
  @override
  _VehicleChartPageState createState() => _VehicleChartPageState();
}
class _VehicleChartPageState extends State<VehicleChartPage> {
  List<dynamic> normalLoss = [];
  _loadAsset() async{
    String myData = await  rootBundle.loadString('lib/normalLoss.csv');
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(myData);
    setState(() {
      normalLoss = rowsAsListOfValues.expand((element) => element).toList();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadAsset();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = (MediaQuery.of(context).size.height-appWindow.titleBarHeight);
    AnomalHistoryIndex anomalIndex = context.watch<AnomalHistoryIndex>();

    MQTTModel mqttModel = context.watch<MQTTModel>();
    double? tickValue  = context.watch<HistogramTick>().histTick[mqttModel.currentVehicleId];

    return mqttModel.ohtDatas[mqttModel.currentVehicleId] == null? Container():
    Container(
      width: width*0.83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: height*0.05,
                width: width*0.15  ,
                child: Padding(
                  padding:  EdgeInsets.only( top: height*0.01),
                  child: Text('Log-Loss Histogram',style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.bold,fontSize: 17),),
                ),
              ),
              Container(
                width: width*0.3,
                height: height*0.25,
                  child: normalLoss.length == 0? Container() : SfCartesianChart(
                      primaryXAxis: NumericAxis(
                        minimum: -50,
                        maximum: 0,
                      ),
                      series: <ChartSeries>[
                        HistogramSeries<dynamic, double>(
                            dataSource: normalLoss,
                            yValueMapper: (dynamic data, _) => log(data)  * 4,
                            binInterval: 1,
                            color: Colors.indigo,
                            borderWidth: 7,
                          spacing: 0
                        ),
                        ColumnSeries<double, double>(
                            spacing: 0,
                            dataSource: tickValue == null ? [-30] : [tickValue!],
                            xValueMapper: (double sales, _) => sales,
                            yValueMapper: (double sales, _) => 100,
                            borderWidth: 3,
                            color: Colors.pink,
                            opacity: 0.5
                        ),
                      ]
                  )
              ),
            ],
          ),
          SizedBox(width: 50,),
          Container(
            //height: 500,
            width: width*0.28,
            child: Column(
              children: [
                Container(
                  height: height*0.05,
                  width: width*0.15  ,
                  child: Padding(
                    padding: const EdgeInsets.only( top: 18),
                    child: Text('이상 데이터 History',style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.bold,fontSize: 17),),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: height*0.05,
                        width: width*0.07,
                        decoration: BoxDecoration(
                            color: Color(0xFF7283FC),
                            border: Border(
                              top: BorderSide(width: 2,color:Colors.white70),
                              bottom: BorderSide(width: 2,color: Colors.white70),
                              left:  BorderSide(width: 2,color: Colors.white70),
                              right:  BorderSide(width: 2,color: Colors.white70),
                            )
                        ),
                        child: Center(child: Text('Time',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),))
                    ),
                    Container(
                        height: height*0.05,
                        width: width*0.07,
                        decoration: BoxDecoration(
                            color: Color(0xFF7283FC),
                            border: Border(
                              top: BorderSide(width: 2,color:Colors.white70),
                              bottom: BorderSide(width: 2,color: Colors.white70),
                              left:  BorderSide(width: 2,color: Colors.white70),
                              right:  BorderSide(width: 2,color: Colors.white70),
                            )
                        ),
                        child: Center(child: Text('Vehicle',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),))
                    ),
                    Container(
                        height: height*0.05,
                        width: width*0.07,
                        decoration: BoxDecoration(
                            color: Color(0xFF7283FC),
                            border: Border(
                              top: BorderSide(width: 2,color:Colors.white70),
                              bottom: BorderSide(width: 2,color: Colors.white70),
                              left:  BorderSide(width: 2,color: Colors.white70),
                              right:  BorderSide(width: 2,color: Colors.white70),
                            )
                        ),
                        child: Center(child: Text('Segment',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),))
                    ),
                    Container(
                        height: height*0.05,
                        width: width*0.07,
                        decoration: BoxDecoration(
                            color: Color(0xFF7283FC),
                            border: Border(
                              top: BorderSide(width: 2,color:Colors.white70),
                              bottom: BorderSide(width: 2,color: Colors.white70),
                              left:  BorderSide(width: 2,color: Colors.white70),
                              right:  BorderSide(width: 2,color: Colors.white70),
                            )
                        ),
                        child: Center(child: Text('Loss',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),))
                    ),

                  ],
                  ),
                Container(

                  height: height*0.2,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: mqttModel.anomalDatas.length,
                      itemBuilder: (BuildContext context, int index){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                anomalIndex.changeIndex(index);
                              },
                              child: Container(
                                height: height*0.05,
                                width: width*0.07,
                                  decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(width: 2,color: Colors.black12),
                                        bottom: BorderSide(width: 2,color: Colors.black12),
                                        right:  BorderSide(width: 2,color: Colors.black12),
                                      )
                                  ),
                                  child: Center(child: Text(mqttModel.anomalDatas[index]!.first.anomal_timestamp),),
                              ),
                            ),
                            Container(
                                height: height*0.05,
                                width: width*0.07,
                                decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 2,color: Colors.black12),
                                      right:  BorderSide(width: 2,color: Colors.black12),
                                    )
                                ),
                                child: Center(child: Text(mqttModel.anomalDatas[index]!.first.vehicle_id))
                            ),
                            Container(
                                height: height*0.05,
                                width: width*0.07,
                                decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 2,color: Colors.black12),
                                      right:  BorderSide(width: 2,color: Colors.black12),
                                    )
                                ),
                                child: Center(child: Text(mqttModel.anomalDatas[index]!.first.current_segment.toString()))
                            ),
                            Container(
                                height: height*0.05,
                                width: width*0.07,
                                decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 2,color: Colors.black12),
                                      right:  BorderSide(width: 2,color: Colors.black12),
                                    )
                                ),
                                child: Center(child: Text('N/A'))
                            ),

                          ],
                        );
                      }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
DateTime calcMaxDate(List<DateTime> dates){
  DateTime maxDate = dates[0];
  dates.forEach((date){
    if(date.isAfter(maxDate)){
      maxDate=date;
    }
  });
  return maxDate;
}