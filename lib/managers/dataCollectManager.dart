import 'dart:convert';
import 'dart:io';

import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:csv/csv.dart';
class DataCollectManager{
  List<OhtDataModel> datas = [];
  List<List<dynamic>> csvBase= [];

  void startStoreData( OhtDataModel data,int numberOfDatasNeeded) async {
    if(csvBase.length >= numberOfDatasNeeded){
      csvBase.add([data.anomal_timestamp,
        data.accx_rms,
        data.accy_rms,
        data.accz_rms,
        data.yaw,
        data.drive_right_torque,
        data.drive_left_torque,
        data.drive_right_speed,
        data.drive_left_speed,
        data.fork_lift_speed,
        data.fork_lift_torque,
        data.oht_event_label
      ]);
    }
    else{
      String csv = const ListToCsvConverter().convert(csvBase);
      File file = await new File('lib/ss.csv').create(recursive: true);
      file.writeAsString(csv);
    }
  }
}