import 'package:flutter/cupertino.dart';

class BottomController with ChangeNotifier{
  int index = 0;
  changingIndex(int value){
    index = value;
    notifyListeners();
  }
}