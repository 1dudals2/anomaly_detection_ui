import 'package:anomaly_detection_ui/src/providers/MQTTProvider.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MQTTProvider();
  }
}