import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';

class VehicleList extends StatefulWidget {
  const VehicleList({Key? key}) : super(key: key);

  @override
  _VehicleListState createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {

  bool mqttInitialized = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio*0.3;
    MQTTModel mqttModel = context.watch<MQTTModel>();
    if(mqttInitialized ==false) {
      MQTTManager().InitMQTTManager(mqttModel, "01", DataCollectManager());
      mqttModel.addOht("01");
      mqttInitialized = true;
    }
    int? numberOfVehicles = 0;
    if( mqttModel.ohtDatas["01"] != null && mqttModel.ohtDatas["01"]!.isNotEmpty && mqttModel. ohtDatas["01"]?.last?.num_of_vehicles != null)
      numberOfVehicles = mqttModel. ohtDatas["01"]?.last.num_of_vehicles;
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
          mqttModel.ohtDatas["01"] != null ? Expanded(
            child: Container(
              width: 300,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,//itemCount: numberOfVehicles, @todo number of vehicles로 바꿔야함
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onDoubleTap: (){

                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent)
                        ),
                        height: 100,
                        child: Row(
                          children: [
                            Container(
                             // width:200,
                              height: 100,
                              child: Center(
                                child: Text("OHT $index", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 20,
                            )
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