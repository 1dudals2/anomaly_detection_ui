import 'package:flutter/cupertino.dart';

class AnomalHistoryIndex extends ChangeNotifier{
  int index = 0;
  void changeIndex(int newIndex){
    index = newIndex;
    notifyListeners();
}

}
