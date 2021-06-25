import 'package:anomaly_detection_ui/commonly_used_widget/MapPaintingWidget.dart';
import 'package:anomaly_detection_ui/commonly_used_widget/VehicleList.dart';
import 'package:anomaly_detection_ui/commonly_used_widget/trackButton.dart';
import 'package:anomaly_detection_ui/commonly_used_widget/vehicleButton.dart';
import 'package:anomaly_detection_ui/constants/WindowsButtonColor.dart';
import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:anomaly_detection_ui/src/pages/trackPage.dart';
import 'package:anomaly_detection_ui/src/pages/vehiclePage.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class MainPage extends StatefulWidget{

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool mqttInitialized = false;
  int mode = 0;

  Widget build(BuildContext context){

    ValueSetter<int> changeModeFunction = (int changedMode) => {
    setState(() {
    mode = changedMode;
    })};

    MQTTModel mqttModel = context.watch<MQTTModel>();
    if(mqttInitialized ==false) {
      MQTTManager().InitMQTTManager(mqttModel, "01", DataCollectManager());
      mqttModel.addOht("01");
      mqttInitialized = true;
    }
    int? numberOfVehicles = 0;
    if( mqttModel.ohtDatas["01"] != null && mqttModel.ohtDatas["01"]!.isNotEmpty && mqttModel. ohtDatas["01"]?.last?.num_of_vehicles != null)
      numberOfVehicles = mqttModel. ohtDatas["01"]?.last.num_of_vehicles;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WindowTitleBarBox(
                child: Row(
                  children: [
                    TrackButton(changeModeFunction: changeModeFunction,currentMode: mode,),
                    VehicleButton(changeModeFunction: changeModeFunction,currentMode : mode),
                    Expanded(child: MoveWindow()),
                    Row(
                      children: [

                        MinimizeWindowButton(
                          colors: buttonColors,
                        ),
                        MaximizeWindowButton(
                          colors: buttonColors,
                        ),
                        CloseWindowButton(
                          colors: closeButtonColors,
                        ),

                      ],
                    )
                  ],
                ),
              ),
              mode == 0 ?TrackPage()
              : VehiclePage(),

            ],
          ),
        ),
      ),
    );
  }
}
