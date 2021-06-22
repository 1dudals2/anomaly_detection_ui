import 'package:anomaly_detection_ui/models/omsDataModel.dart';
import 'package:csv/csv.dart';
class dataCollectManager{
  List<OmsDataModel> datas = [];
  void turnToCSV(){
    List<List<dynamic>> dd = [["dd : 3"],["dd : 3"]];
  }
  void startStoreData( OmsDataModel data,int numberOfDatasNeeded){
    datas.add(data);
    if(datas.length >= numberOfDatasNeeded){
      //transform to csv
    }
  }
}