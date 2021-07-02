import 'dart:collection';

import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:flutter/cupertino.dart';
class MQTTModel with ChangeNotifier {
  bool isinited = false;
  String currentVehicleId = "01";
  int currentSegmentId = 0;
  List<Queue<OhtDataModel>> anomalDatas = [];
  HashMap <String, Queue<OhtDataModel>> ohtDatas = new HashMap();
  HashMap<int, int>  suspiciousSegments = new HashMap();
  int currentAnomalDataIndex = -1;
  HashMap<String, bool> isWriting = new HashMap();
  void addOht(String ohtId) {
    ohtDatas[ohtId] = Queue();
    isWriting[ohtId] = false;
  }
  void isinitiatedChange(){
    isinited = true;
    notifyListeners();
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
        if(isWriting[ohtId] == true) {
          anomalDatas[currentAnomalDataIndex].add(data);
          if(anomalDatas[currentAnomalDataIndex].length > 100){
            isWriting[ohtId] = false;
          }
        } else {
          anomalDatas.add(new Queue());
          isWriting[ohtId] = true;
          currentAnomalDataIndex += 1;
          anomalDatas[currentAnomalDataIndex].add(data);

        }
      }

    }
    notifyListeners();
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

    void addToSuspiciousSegments(int segmentId){
      if(!suspiciousSegments.containsKey(segmentId)){
        suspiciousSegments[segmentId] = 1;
      }
      else{
        suspiciousSegments[segmentId] =suspiciousSegments[segmentId]! + 1;
      }
      notifyListeners();
    }
  }
