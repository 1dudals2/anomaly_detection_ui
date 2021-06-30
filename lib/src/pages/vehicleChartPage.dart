import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class VehicleChartPage extends StatefulWidget {
  const VehicleChartPage({Key? key}) : super(key: key);

  @override
  _VehicleChartPageState createState() => _VehicleChartPageState();
}

class _VehicleChartPageState extends State<VehicleChartPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -300;
    double height = (MediaQuery.of(context).size.height* MediaQuery.of(context).devicePixelRatio-appWindow.titleBarHeight)*0.5;
    MQTTModel mqttModel = context.watch<MQTTModel>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 750,
          height: 500,
          color: Colors.amberAccent,
          child: Center(child: Text("Graph", style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)),
        ),
        SizedBox(width: 50,),
        Container(
          width: 800,
          height: 500,
          // decoration: BoxDecoration(
          //     border: Border(
          //       bottom: BorderSide(width: 2,color: Colors.grey),
          //     )
          // ),
          //padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2,color: Colors.lightBlue),
                            bottom: BorderSide(width: 2,color: Colors.lightBlue),
                            left:  BorderSide(width: 2,color: Colors.lightBlue),
                            right:  BorderSide(width: 2,color: Colors.lightBlue),
                          )
                      ),
                      child: Text('Time',textAlign: TextAlign.center,)
                  ),
                  Container(
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2,color: Colors.lightBlue),
                            bottom: BorderSide(width: 2,color: Colors.lightBlue),
                            right:  BorderSide(width: 2,color: Colors.lightBlue),
                          )
                      ),

                      child: Text('Vehicle',textAlign: TextAlign.center,)
                  ),
                  Container(
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2,color: Colors.lightBlue),
                            bottom: BorderSide(width: 2,color: Colors.lightBlue),
                            right:  BorderSide(width: 2,color: Colors.lightBlue),
                          )
                      ),
                      child: Text('Segment',textAlign: TextAlign.center,)
                  ),
                  Container(
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2,color: Colors.lightBlue),
                            bottom: BorderSide(width: 2,color: Colors.lightBlue),
                            right:  BorderSide(width: 2,color: Colors.lightBlue),
                          )
                      ),
                      child: Text('Loss',textAlign: TextAlign.center,)
                  ),
                  Container(
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2,color: Colors.lightBlue),
                            bottom: BorderSide(width: 2,color: Colors.lightBlue),
                            right:  BorderSide(width: 2,color: Colors.lightBlue),
                          )
                      ),
                      child: Text('Event_Label',textAlign: TextAlign.center,)
                  ),
                ],
              ),
              Container(
                //height: 300,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: mqttModel.anomalDatas.length,
                    itemBuilder: (BuildContext context, int index){
                      String currentKey = mqttModel.anomalDatas.keys.elementAt(index);
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(width: 2,color: Colors.grey),
                                    bottom: BorderSide(width: 2,color: Colors.grey),
                                    right:  BorderSide(width: 2,color: Colors.grey),
                                  )
                              ),
                              child: Text(mqttModel.anomalDatas[currentKey]!.first.anomal_timestamp)
                          ),
                          Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 2,color: Colors.grey),
                                    right:  BorderSide(width: 2,color: Colors.grey),
                                  )
                              ),
                              child: Text(currentKey)
                          ),
                          Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 2,color: Colors.grey),
                                    right:  BorderSide(width: 2,color: Colors.grey),
                                  )
                              ),
                              child: Text('adf')
                          ),
                          Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 2,color: Colors.grey),
                                    right:  BorderSide(width: 2,color: Colors.grey),
                                  )
                              ),
                              child: Text('adf')
                          ),
                          Container(
                              height: 70,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border(

                                            bottom: BorderSide(width: 2,color: Colors.grey),
                                            right:  BorderSide(width: 2,color: Colors.grey),
                                          )
                                      ),
                                      child: Text('adf')
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