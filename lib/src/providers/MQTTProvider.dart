import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:anomaly_detection_ui/src/pages/mainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MQTTProvider extends StatelessWidget{
  Widget build(BuildContext context){

    return ChangeNotifierProvider.value(
      value: new MQTTModel(),

      child: MainPage()
    );
  }
}