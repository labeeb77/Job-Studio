import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

class FirebaseProvider with ChangeNotifier {

  String? fileUrl;
final firebase_storage.FirebaseStorage storage =  firebase_storage.FirebaseStorage.instance;
         // Upload Resume

  Future uploadToFirebase(
      String filePath, String fileName, String folderName) async {
    File file = File(filePath);
    try {
      log("entered to upload task");
      firebase_storage.UploadTask uploadTask = 
      storage.ref().child("$folderName/$fileName").putFile(file);
      fileUrl = await (await uploadTask).ref.getDownloadURL();

      notifyListeners();
      log("file url :$fileUrl");
    } catch (e) {
      log(e.toString());
    }
  }

         // Delete Resume

        //  Future deleteFile(String fileUrl)async{
        //   await FirebaseStorage.instance.refFromURL(fileUrl).delete();
        //   log("file deleted successfully");
        //  }



}
