import 'dart:convert';
import 'dart:io';

import 'package:anomaly_detection_ui/models/ohtDataModel.dart';
import 'package:csv/csv.dart';
class DataCollectManager{
  List<OhtDataModel> datas = [];
  List<List<dynamic>> csvBase= [["da","da","da"],["sa","sa","sa"],["ea","ea","ea"]];
  Future<void> turnToCSV() async {
    /*String csv = const ListToCsvConverter().convert(csvBase);
    File file = await new File('lib/ss.csv').create(recursive: true);
    file.writeAsString(csv);
    print(csv);*/
  }
  void startStoreData( OhtDataModel data,int numberOfDatasNeeded){
    datas.add(data);
    if(datas.length >= numberOfDatasNeeded){
      //transform to csv
    }
  }
}