import 'dart:io';

import 'package:flutter/material.dart';

class LocalProvider with ChangeNotifier{

  //password visibility
  bool isVisible = false;

  void toggleVisibility(){
    isVisible = !isVisible;
    notifyListeners();
  }
  
  //PDF file picker

  File? _selectedFile;
  File? get selectedFile => _selectedFile;

  void setSelectedFile(File? file){
    _selectedFile = file;
    notifyListeners();
  }

  
}