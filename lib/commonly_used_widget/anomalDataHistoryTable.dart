import 'package:anomaly_detection_ui/commonly_used_widget/trackPlotWidget.dart';
import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
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
    MQTTModel mqttModel = context.watch<MQTTModel>();

    return Padding(
      padding: const EdgeInsets.only(left : 12.0, right: 12.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                    height: 240,
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
                                  child: Center(child: Text(mqttModel.anomalDatas[index]!.first.anomal_timestamp))
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
            ),
            SizedBox(
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
