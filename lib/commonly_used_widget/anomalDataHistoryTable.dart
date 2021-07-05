import 'package:anomaly_detection_ui/commonly_used_widget/trackPlotWidget.dart';
import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/AnomalHistoryIndex.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnomalHistoryTable extends StatefulWidget {
  const AnomalHistoryTable({Key? key}) : super(key: key);

  @override
  _AnomalHistoryTableState createState() => _AnomalHistoryTableState();
}

class _AnomalHistoryTableState extends State<AnomalHistoryTable> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = (MediaQuery.of(context).size.height-appWindow.titleBarHeight);

    MQTTModel mqttModel = context.watch<MQTTModel>();
    AnomalHistoryIndex anomalIndex = context.watch<AnomalHistoryIndex>();
    return SingleChildScrollView(
     // scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.white,
        width: width*0.7,
        height: height*0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Container(
              margin:  EdgeInsets.fromLTRB(width*0.03, height*0.0, width*0.0, 0),
              width: width*0.28,
              child: Column(
                children: [
                  Container(
                    height: height*0.05,
                    width: width*0.15  ,
                    child: Padding(
                      padding:  EdgeInsets.only( top: height*0.01),
                      child: Text('이상 데이터 History-V',style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.bold,fontSize: 17),),
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
                                    child: Center(child: Text(mqttModel.anomalDatas[index]!.first.anomal_timestamp))
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
            ),
            Container(
              margin:  EdgeInsets.fromLTRB(width*0.03, height*0.0, width*0.03, 0),
              width: width*0.21,
              child: Column(
                children: [
                  Container(
                    height: height*0.05,
                    width: width*0.15  ,
                    child: Padding(
                      padding:  EdgeInsets.only( top: height*0.01),
                      child: Text('Abnormal Tracks',style: TextStyle(color:Colors.indigo,fontWeight: FontWeight.bold,fontSize: 17),),
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
                          child: Center(child: Text('Alarm Rep',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),))
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
                          child: Center(child: Text('Loss Ratio',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),))
                      ),


                    ],
                  ),
                  Container(
                    height: height*0.2,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: mqttModel.suspiciousSegments.keys.toList().length,
                        itemBuilder: (BuildContext context, int index){
                          List<int> sortedKeys = (mqttModel.suspiciousSegments.keys.toList());
                          sortedKeys.sort();
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                    height: height*0.05,
                                    width: width*0.07,
                                    decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(width: 2,color: Colors.black12),
                                          bottom: BorderSide(width: 2,color: Colors.black12),
                                          right:  BorderSide(width: 2,color: Colors.black12),
                                        )
                                    ),
                                    child: Center(child: Text(sortedKeys[index].toString()))
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
                                  child: Center(child: Text(mqttModel.suspiciousSegments![sortedKeys[index]].toString()))
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
            ),
          ],
        ),
      ),
    );
  }
}
