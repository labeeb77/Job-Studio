import 'dart:io';

import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier{

  // Upload photo 

  File? _photo;

  void setPhoto(File photo){
    _photo = photo;
    notifyListeners();
  }
  File get photo {
    return _photo ?? File('assets/images/unknown_photo.png');
  }
}