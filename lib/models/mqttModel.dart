import 'dart:collection';

import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:flutter/cupertino.dart';
class MQTTModel with ChangeNotifier {
  String currentVehicleId = "01";
  int currentSegmentId = 0;
  HashMap<String, Queue<OhtDataModel>> anomalDatas = new HashMap();
  HashMap <String, Queue<OhtDataModel>> ohtDatas = new HashMap();

  void addOht(String ohtId) {
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
      if (data.isNormal == false) {
        if(!anomalDatas.keys.contains(data.vehicle_id)){
          anomalDatas[data.vehicle_id] = new Queue();
        }
        anomalDatas[data.vehicle_id]?.add(data);
        notifyListeners();
      }
    }
  }
    void changeCurrentVehicleId(int newId) {
      newId ++;
      String res = "";
      if (newId < 10) {
        res += "0" + newId.toString();
      }
      else {
        res = newId.toString();
      }
      currentVehicleId = res;
      print(res);
      notifyListeners();
    }
    void changeCurrentSegmentId(int newId) {
      currentSegmentId = newId;
      notifyListeners();
    }
  }
