import 'dart:collection';

import 'package:anomaly_detection_ui/models/omsDataModel.dart';
import 'package:flutter/cupertino.dart';
class MQTTModel with ChangeNotifier{
  Queue<OmsDataModel> datas =  Queue();

  void addToDatas(OmsDataModel data){

    if(datas.length < 100){
      datas.add(data);
    }
    else{
      datas.removeFirst();
      datas.add(data);
    }
    notifyListeners();
  }
}