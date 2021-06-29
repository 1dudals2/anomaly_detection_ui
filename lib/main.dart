import 'dart:convert';
import 'package:anomaly_detection_ui/src/providers/MQTTProvider.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/services.dart';

import 'models/MapData.dart';
void main(){
  runApp(MyApp());
  doWhenWindowReady(() {
    final initialSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    loadJsonData().then((value) => (value.segments.forEach((element) {print(element.id);})));
    //DataCollectManager().turnToCSV();
    return MQTTProvider();
  }
}



Future<MapData> loadJsonData() async {
  var jsonText = await rootBundle.loadString('lib/semioht-v3.0.0.json');
  Map<String, dynamic> jsonMap = jsonDecode(jsonText);
  var map = MapData.fromJson(jsonMap);
  return(map);
}
