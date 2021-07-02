import 'dart:collection';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class HistogramTick extends ChangeNotifier{
  HashMap<String , double> histTick = new HashMap();
  HashMap<String , int> histTickIndex = new HashMap();
  List<dynamic> normalLoss = [];
  HistogramTick(){
    _loadAsset();
  }
  _loadAsset() async{
    String myData = await  rootBundle.loadString('lib/normalLoss.csv');
    List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(myData);
    normalLoss = rowsAsListOfValues.expand((element) => element).toList();
  }
  void changeTickValue( String ohtId){
    if(histTickIndex[ohtId] == null){
      histTickIndex[ohtId] = 0;
    }
    histTick[ohtId] = (log(normalLoss[histTickIndex[ohtId]!]) * 4);
    if (histTickIndex[ohtId]! < normalLoss.length - 1)
      histTickIndex[ohtId] = histTickIndex[ohtId]! + 1;
    else
      histTickIndex[ohtId] = 0;
    notifyListeners();
  }
  void changeTickValueAnomal( String ohtId){
    histTick[ohtId] = doubleInRange(-22, 0);
    notifyListeners();
  }
  final _random = new Random();

  double doubleInRange( num start, num end) =>
      _random .nextDouble() * (end - start) + start;
}