import 'package:anomaly_detection_ui/models/AnomalHistoryIndex.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:anomaly_detection_ui/src/pages/mainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MQTTProvider extends StatelessWidget{
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(
          value: new MQTTModel(),
      ),
      ChangeNotifierProvider.value(
          value: new AnomalHistoryIndex()
      ),
    ],
    child: MainPage(),);
  }
}