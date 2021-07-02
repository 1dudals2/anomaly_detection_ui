import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class VehicleChartPage extends StatefulWidget {
  const VehicleChartPage({Key? key}) : super(key: key);
  @override
  _VehicleChartPageState createState() => _VehicleChartPageState();
}
class _VehicleChartPageState extends State<VehicleChartPage> {
  @override
  Widget build(BuildContext context) {

    MQTTModel mqttModel = context.watch<MQTTModel>();

    return mqttModel.ohtDatas[mqttModel.currentVehicleId] == null? Container():
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 550,
          height: 400,
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  // Renders line chart
                  LineSeries<OhtDataModel, String>(
                      dataSource: mqttModel.ohtDatas[mqttModel.currentVehicleId]!.toList(),
                      xValueMapper: (OhtDataModel data, _) => data.anomal_timestamp,
                      yValueMapper: (OhtDataModel data, _) => data.accx_rms,
                  )
                ]
            )
        ),
        Container(
          width: 600,
          child: Column(
            children: [
              Container(
                height: 50,
                width: 750  ,
                child: Padding(
                  padding: const EdgeInsets.only( top: 18),
                  child: Text('이상 데이터 History',style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.bold,fontSize: 17),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 70,
                      width: 150,
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
                      height: 70,
                      width: 150,
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
                      height: 70,
                      width: 150,
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
                      height: 70,
                      width: 150,
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
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: mqttModel.anomalDatas.length,
                    itemBuilder: (BuildContext context, int index){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(width: 2,color: Colors.black12),
                                    bottom: BorderSide(width: 2,color: Colors.black12),
                                    right:  BorderSide(width: 2,color: Colors.black12),
                                  )
                              ),
                              child: Center(child: Text(mqttModel.anomalDatas[index]!.first.anomal_timestamp),),
                          ),
                          Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 2,color: Colors.black12),
                                    right:  BorderSide(width: 2,color: Colors.black12),
                                  )
                              ),
                              child: Center(child: Text(index.toString()))
                          ),
                          Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 2,color: Colors.black12),
                                    right:  BorderSide(width: 2,color: Colors.black12),
                                  )
                              ),
                              child: Center(child: Text('adf'))
                          ),
                          Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 2,color: Colors.black12),
                                    right:  BorderSide(width: 2,color: Colors.black12),
                                  )
                              ),
                              child: Center(child: Text('adf'))
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