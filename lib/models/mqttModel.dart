import 'dart:collection';

import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:flutter/cupertino.dart';
class MQTTModel with ChangeNotifier{
  HashMap <String, Queue<OhtDataModel>> ohtDatas = new HashMap();
  void addOht(String ohtId){
    ohtDatas[ohtId] = Queue();
  }
  void addToDatas(String ohtId, OhtDataModel data) {
    int? length = ohtDatas[ohtId]?.length;
    if (length != null) {
      if (length < 100) {
        ohtDatas[ohtId]?.add(data);
      }
      else {
        ohtDatas[ohtId]?.removeFirst();
        ohtDatas[ohtId]?.add(data);

      }
      notifyListeners();
    }
  }
}