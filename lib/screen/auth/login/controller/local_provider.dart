import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../seeker side/application_screen/service/firebase.dart';

class LocalProvider with ChangeNotifier{
 FirebaseProvider storage = FirebaseProvider();

  //password visibility
  bool isVisible = false;
  File? pdfFile;
  File? pdfPath;

  void toggleVisibility(){
    isVisible = !isVisible;
    notifyListeners();
  }
  
   //upload PDF

  Future pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ["pdf"],
    );

    if (result != null) {
      pdfFile = File(result.files.single.path!);
      pdfPath = File(result.files.single.name);
      storage
          .uploadToFirebase(pdfFile!.path, pdfPath.toString(), "test")
          .then((value) => log("file stored in firebase"));
      // ignore: use_build_context_synchronously
     
     
  }




  }
  
}