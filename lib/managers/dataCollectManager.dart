import 'dart:io';
import 'dart:isolate';
import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:csv/csv.dart';
writeToFile( var csvBase) async{
  String csv = const ListToCsvConverter().convert(csvBase);
  File file = await new File('lib/ohtNormalData.csv').create(recursive: true);
  file.writeAsString(csv + '\n',
      mode: FileMode.append);
  return true;
}

class DataCollectManager{
  List<OhtDataModel> datas = [];
  List<List<dynamic>> csvBase= [];
  int dataWrittenToFile = 0;



  void startStoreData( OhtDataModel data,int numberOfDatasNeeded) async {
    if(csvBase.length < numberOfDatasNeeded / 1000){
      csvBase.add([
        data.anomal_timestamp,
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
       data.event_label ,
      ]);
      print(csvBase.length);
    }

    else if (dataWrittenToFile <= numberOfDatasNeeded){
      Isolate.spawn(writeToFile, csvBase);
      dataWrittenToFile += 1000;
      csvBase = [];
      csvBase.add([
        data.anomal_timestamp,
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
        data.event_label ,
      ]);

    }
  }
}