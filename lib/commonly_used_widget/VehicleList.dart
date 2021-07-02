import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
class VehicleList extends StatefulWidget {
  const VehicleList({Key? key}) : super(key: key);
  @override
  _VehicleListState createState() => _VehicleListState();
}
class _VehicleListState extends State<VehicleList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = (MediaQuery.of(context).size.height-appWindow.titleBarHeight);
    MQTTModel mqttModel = context.watch<MQTTModel>();

    if(mqttModel.ohtDatas[mqttModel.currentVehicleId] != null){
      //print(mqttModel.ohtDatas[mqttModel.currentVehicleId]!.first.isNormal);
    }
    int? numberOfVehicles = 0;
    if( mqttModel.ohtDatas[mqttModel.currentVehicleId] != null && mqttModel.ohtDatas[mqttModel.currentVehicleId]!.isNotEmpty && mqttModel. ohtDatas["01"]?.last?.num_of_vehicles != null)
      numberOfVehicles = mqttModel. ohtDatas[mqttModel.currentVehicleId]?.last.num_of_vehicles;
    return  Container(
      margin: EdgeInsets.only(left: width*0.02),
      width: width*0.15,
      decoration: BoxDecoration(
        //color: Colors.lightBlue,
          border: Border.all(color:Colors.indigo)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //  mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Center(child: Text("Active Vehicles", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
            width: width*0.15,
            height: height*0.1,
            decoration: BoxDecoration(
                //color: Color(0xFF7283FC),
                border: Border(
                  bottom: BorderSide(color:Colors.indigo),
                )
            ),
          ),
          mqttModel.ohtDatas[mqttModel.currentVehicleId] != null ? Expanded(
            child: Container(
              width: width*0.15,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: numberOfVehicles,//itemCount: numberOfVehicles, @todo number of vehicles로 바꿔야함
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
                        mqttModel.changeCurrentVehicleId(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Color(0xFF7283FC),
                            border: Border(
                              bottom: BorderSide(color:Colors.indigo),
                            )
                        ),
                        height: height*0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // width:200,
                              padding: EdgeInsets.only(left: width*0.01),
                              height: height*0.1,
                              child: Center(
                                child: Text("OHT  " + (index + 1).toString(), style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                            ),

                            CircleAvatar(
                              backgroundColor:  !mqttModel.ohtDatas["0" + (index + 1).toString()]!.last.is_anomal ? Color(0XFFbfff00) :Color(0XFFdc143c),
                              radius: 18,
                            ),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ) : Container()
        ],
      ),
    );
  }
}