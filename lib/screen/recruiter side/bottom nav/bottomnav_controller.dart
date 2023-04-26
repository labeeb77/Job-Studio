import 'package:flutter/cupertino.dart';

class BottomControllerSeeker with ChangeNotifier{
  int index = 0;
  changingIndex(int value){
    index = value;
    notifyListeners();
  }
}
class BottomControllerRecruiter with ChangeNotifier{
  int index = 0;
  changingIndex(int value){
    index = value;
    notifyListeners();
  }
}