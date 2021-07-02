import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
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
    double width = MediaQuery.of(context).size.width *0.3;
    MQTTModel mqttModel = context.watch<MQTTModel>();

    if(mqttModel.ohtDatas[mqttModel.currentVehicleId] != null){
      //print(mqttModel.ohtDatas[mqttModel.currentVehicleId]!.first.isNormal);
    }
    int? numberOfVehicles = 0;
    if( mqttModel.ohtDatas[mqttModel.currentVehicleId] != null && mqttModel.ohtDatas[mqttModel.currentVehicleId]!.isNotEmpty && mqttModel. ohtDatas["01"]?.last?.num_of_vehicles != null)
      numberOfVehicles = mqttModel. ohtDatas[mqttModel.currentVehicleId]?.last.num_of_vehicles;
    return  Container(
      width: 300,
      decoration: BoxDecoration(
        //color: Colors.lightBlue,
          border: Border.all(color: Colors.blueAccent)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //  mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Center(child: Text("Active Vehicles", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
            width: 300,
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
            ),
          ),
          mqttModel.ohtDatas[mqttModel.currentVehicleId] != null ? Expanded(
            child: Container(
              width: 300,
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
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // width:200,
                              height: 100,
                              child: Center(
                                child: Text("OHT  " + (index + 1).toString(), style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                            ),

                            CircleAvatar(
                              backgroundColor:  mqttModel.ohtDatas["0" + (index + 1).toString()]!.last.is_anomal ? Color(0XFFbfff00) :Color(0XFFdc143c),
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