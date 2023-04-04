import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseProvider with ChangeNotifier {
  final FirebaseStorage storage = FirebaseStorage.instance;
  String? fileUrl;

  Future uploadToFirebase(
      String filePath, String fileName, String folderName) async {
    File file = File(filePath);
    try {
      UploadTask uploadTask =
          storage.ref().child("$fileName/$fileName").putFile(file);
      fileUrl = await (await uploadTask).ref.getDownloadURL();
    } catch (e) {
      log(e.toString());
    }
  }
}
