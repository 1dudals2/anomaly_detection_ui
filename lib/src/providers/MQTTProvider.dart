import 'package:anomaly_detection_ui/models/AnomalHistoryIndex.dart';
import 'package:anomaly_detection_ui/models/histogramTick.dart';
import 'package:anomaly_detection_ui/models/mqttModel.dart';
import 'package:anomaly_detection_ui/src/pages/mainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MQTTProvider extends StatelessWidget{
  HistogramTick hisTick = new HistogramTick();
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(
          value: new MQTTModel(hisTick),
      ),
      ChangeNotifierProvider.value(
          value: new AnomalHistoryIndex()
      ),
      ChangeNotifierProvider.value(
          value: hisTick
      )
    ],
    child: MainPage(),);
  }
}