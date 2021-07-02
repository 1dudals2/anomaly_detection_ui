import 'dart:convert';
import 'package:anomaly_detection_ui/managers/dataCollectManager.dart';
import 'package:anomaly_detection_ui/managers/mqttManager.dart';
import 'package:anomaly_detection_ui/src/providers/MQTTProvider.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'models/mqttModel.dart';
void main(){
  runApp(MyApp());
  doWhenWindowReady(() {
    // final initialSize = Size(1700, 1080);
    // appWindow.minSize = initialSize;
    // appWindow.size = initialSize;
    MaximizeWindowButton().onPressed!();
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    //DataCollectManager().turnToCSV();
    return MQTTProvider();
  }
}




